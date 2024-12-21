//
//  SwikiActor.swift
//  Swiki
//
//  Created by Кирилл Тила on 21.12.2024.
//

import Foundation

@globalActor
struct SwikiActor {
    static let shared = SwikiLimiterActor()
}

fileprivate struct SubmittedJob<T: Sendable>: Sendable {
    /// Собственно работа (асинхронная, бросающая).
    let work: @Sendable () async throws -> T
    /// Continuation, через который вернём результат или ошибку.
    let continuation: CheckedContinuation<T, any Error>
}

actor SwikiLimiterActor {

    /// Обёртка для SubmittedJob
    private struct AnySubmittedJob: Sendable{
        let run: @Sendable () async -> Void
    }

    // Ограничения согласно API: https://shikimori.one/api/doc
    // API access is limited by 5rps and 90rpm
    private let rpsLimit = 5
    private let rpmLimit = 90

    // Временные метки, чтобы считать RPS/RPM
    private var requestTimestamps: [Date] = []

    // MARK: - AsyncStream и его Continuation

    /// Continuation, чтобы «складывать» новые задания в поток.
    private let continuation: AsyncStream<AnySubmittedJob>.Continuation
    /// AsyncStream, по которому «воркер» будет итерироваться.
    nonisolated private let stream: AsyncStream<AnySubmittedJob>

    // MARK: - Инициализация

    init() {
        (self.stream, self.continuation) = AsyncStream<AnySubmittedJob>.makeStream()
        Task {
            for await anyJob in stream {
                await anyJob.run()
            }
        }
    }

    // MARK: - Публичный метод submit<T>

    /// Добавление задачи на выполнение.
    func submit<T: Sendable>(
        _ work: @Sendable @escaping () async throws -> T
    ) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            let job = SubmittedJob(work: work, continuation: continuation)

            // Оборачиваем в AnySubmittedJob для Stream
            let anyJob = AnySubmittedJob {
                await self.runJob(job)
            }

            self.continuation.yield(anyJob)
        }
    }

    // MARK: - Основная логика выполнения одного задания

    /// «Разворачиваем» SubmittedJob и обрабатываем RPS/RPM.
    private func runJob<T>(_ job: SubmittedJob<T>) async {
        do {
            // Перед выполнением — ждём, если лимиты превышены
            try await waitIfNeeded()

            requestTimestamps.append(Date())

            let result = try await job.work()

            job.continuation.resume(returning: result)
        } catch {
            job.continuation.resume(throwing: error)
        }
    }


    // MARK: - Логика ожидания при превышении лимитов

    private func waitIfNeeded() async throws {
        let now = Date()
        // Удаляем старые timestamps (старше 60 сек):
        requestTimestamps.removeAll { now.timeIntervalSince($0) >= 60 }

        // 1) 90 в минуту
        // Проверка: если собралось достаточно «таймстемпов», чтобы превысить лимит в минуту (rpmLimit),
        // и при этом удаётся взять первый (самый старый) элемент массива timestamps...
        if requestTimestamps.count >= rpmLimit, let oldest = requestTimestamps.first {

            // Считаем, сколько времени прошло с момента самого старого запроса
            let timeSinceOldest = now.timeIntervalSince(oldest)

            // Если мы хотим максимум 90 запросов/минуту, то выясняем,
            // сколько «остаётся» до 60 секунд с момента самого старого.
            // Если timeSinceOldest = 10, то needToWait = 50
            let needToWait = 60 - timeSinceOldest

            // Проверяем, действительно ли нужно ждать (ведь может оказаться, что timeSinceOldest уже 60+ секунд)
            if needToWait > 0 {
                try Task.checkCancellation()
                try await Task.sleep(nanoseconds: UInt64(needToWait * 1_000_000_000))
            }
        }

        // 2) 5 в секунду
        // Берём все timestamps, которые произошли менее чем за 1 секунду до now
        let requestsLastSecond = requestTimestamps.filter { now.timeIntervalSince($0) < 1 }

        // Если таких запросов уже достаточно, чтобы превысить лимит rpsLimit (5),
        // и мы можем получить самый старый из них.
        if requestsLastSecond.count >= rpsLimit, let oldestInLastSecond = requestsLastSecond.first {

            // Сколько времени прошло с момента «старейшего» из последних запросов
            let timeSinceOldest = now.timeIntervalSince(oldestInLastSecond)

            // Сколько ещё ждать, чтобы уложиться в 1 запрос в 200 мс (итого 5/сек),
            // по сути — (1 секунда - прошедшее время).
            let needToWait = 1 - timeSinceOldest

            if needToWait > 0 {
                try Task.checkCancellation()
                try await Task.sleep(nanoseconds: UInt64(needToWait * 1_000_000_000))
            }
            
        }
    }
}
