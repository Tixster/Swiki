import Foundation

public enum SwikiAnimeOrder: String, Codable, Sendable {
    /// By ID
    case id
    case idDesc
    /// By rank
    case ranked
    /// By type
    case kind
    /// By popularity
    case popularity
    /// In alphabetical order
    case name
    /// By release date
    case airedOn
    /// By number of episodes
    case episodes
    /// By status
    case status
    /// By random
    case random
    /// By random
    case rankedRandom
    /// By Shikimori ranking
    case rankedShiki
    case createdAt
    case createdAtDesc

    enum CodingKeys: String, CodingKey {
        case id
        case idDesc = "id_desc"
        case ranked
        case kind
        case popularity
        case name
        case airedOn = "aired_on"
        case episodes
        case status
        case random
        case rankedRandom = "ranked_random"
        case rankedShiki = "ranked_shiki"
        case createdAt = "created_at"
        case createdAtDesc = "created_at_desc"
    }

}
