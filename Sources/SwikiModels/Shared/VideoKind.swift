import Foundation

public enum VideoKind: String, Codable, Sendable {
    /// Promotional Videos
    case pv
    /// Character trailer
    case characterTrailer
    /// Commercial Messages
    case cm
    /// Opening
    case op
    /// Ending
    case ed
    /// Music
    case opEdClip
    /// Clip
    case clip
    /// Other
    case other
    /// Episode preview
    case episodePreview

    enum CodingKeys: String, CodingKey {
        case pv
        case characterTrailer = "character_trailer"
        case cm
        case op
        case ed
        case opEdClip = "op_ed_clip"
        case clip
        case other
        case episodePreview = "episode_preview"
    }

}
