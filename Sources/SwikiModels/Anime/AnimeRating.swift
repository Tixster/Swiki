import Foundation

public enum SwikiAnimeRating: String, Codable, Sendable {
    /// No rating
    case none
    /// G - All ages
    case g
    /// PG - Children
    case pg
    /// PG-13 - Teens 13 or older
    case pg13
    /// R - 17+ recommended (violence & profanity)
    case r
    /// R+ - Mild Nudity (may also contain violence & profanity)
    case rPlus
    /// Rx - Hentai (extreme sexual content/nudity)
    case rx

    enum CodingKeys: String, CodingKey {
        case none
        case g
        case pg
        case pg13 = "pg_13"
        case r
        case rPlus = "r_plus"
        case rx
    }

}