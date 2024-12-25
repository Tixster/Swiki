import Foundation

public enum SwikiContestState: String, Decodable, Sendable {
    case created
    case proposing
    case started
    case finished
}
