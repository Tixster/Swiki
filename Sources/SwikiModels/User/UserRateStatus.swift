import Foundation

public enum UserRateStatus: String, Encodable, Sendable {
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
