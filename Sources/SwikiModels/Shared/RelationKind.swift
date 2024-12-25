import Foundation

public enum SwikiRelationKind: String, Decodable, Sendable {
    case adaptation
    case alternativeSetting = "alternative_setting"
    case alternativeVersion = "alternative_version"
    case character
    case fullStory = "full_story"
    case other
    case parentStory = "parent_story"
    case prequel
    case sequel
    case sideStory = "side_story"
    case spinOff = "spin_off"
    case summary
}
