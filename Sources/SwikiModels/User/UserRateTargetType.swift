import Foundation

public enum SwikiUserRateTargetType: String, Decodable, Sendable {
    case anime
    case manga

    enum CodingKeys: String, CodingKey {
        case anime = "Anime"
        case manga = "Manga"
    }

}
