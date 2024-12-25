import Foundation

public enum SwikiMangaStatus: String, Decodable, Sendable {
    case anons
    case ongoing
    case released
    case paused
    case discontinued
}
