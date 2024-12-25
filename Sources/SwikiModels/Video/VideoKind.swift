import Foundation

public enum SwikiVideoKind: String, Codable, Sendable {
    /// Promotional Videos
    case pv
    /// Character trailer
    case characterTrailer = "character_trailer"
    /// Commercial Messages
    case cm
    /// Opening
    case op
    /// Ending
    case ed
    /// Music
    case opEdClip = "op_ed_clip"
    /// Clip
    case clip
    /// Other
    case other
    /// Episode preview
    case episodePreview = "episode_preview"
}
