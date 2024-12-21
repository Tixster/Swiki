import Foundation

public enum SwikiAnimeKind: String, Codable, Sendable {
    /// TV-сериал
    case tv
    /// Фильм
    case movie
    /// OVA
    case ova
    /// ONA
    case ona
    /// Спецвыпуск
    case special
    /// TV-спецвыпуск
    case tvSpecial
    /// Клип
    case music
    /// Promotional Videos – Проморолик
    case pv
    /// Commercial Messages – Реклама
    case cm
    /// Коротий TV-сериал – до 13 эпизодов
    case tv13
    /// Средний TV-сериал – до 24 эпизодов
    case tv24
    /// Длинный TV-сериал – больше 30 эпизодов
    case tv48

    enum CodingKeys: String, CodingKey {
        case tv
        case movie
        case ova
        case ona
        case special
        case tvSpecial = "tv_special"
        case music
        case pv
        case cm
        case tv13 = "tv_13"
        case tv24 = "tv_24"
        case tv48 = "tv_48"
    }
}
