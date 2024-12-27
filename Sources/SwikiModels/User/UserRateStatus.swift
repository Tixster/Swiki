import Foundation

public enum SwikiUserRateStatus: String, Codable, Sendable {
    /// Planned to Watch
    case planned
    /// Watching
    case watching
    /// Rewatching
    case rewatching
    /// Completed
    case completed
    /// On Hold
    case onHold = "on_hold"
    /// Dropped
    case dropped
}
