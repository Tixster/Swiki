import Foundation

public enum SwikiOrder: String, Codable, Sendable {
    /// By ID
    case id
    case idDesc = "id_desc"
    /// By rank
    case ranked
    /// By type
    case kind
    /// By popularity
    case popularity
    /// In alphabetical order
    case name
    /// By release date
    case airedOn = "aired_on"
    /// By number of episodes
    case episodes
    /// By status
    case status
    /// By random
    case random
    /// By random
    case rankedRandom = "ranked_random"
    /// By Shikimori ranking
    case rankedShiki = "ranked_shiki"
    case createdAt = "created_at"
    case createdAtDesc = "created_at_desc"
}
