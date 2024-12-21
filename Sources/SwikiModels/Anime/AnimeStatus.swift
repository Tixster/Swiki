import Foundation

public enum SwikiAnimeStatus: String, Codable, Sendable {
    /// Сейчас выходит
    case ongoing
    /// Анонс
    case anons
    /// Вышедшее
    case released
    /// Недавно вышедшее
    case latest
}
