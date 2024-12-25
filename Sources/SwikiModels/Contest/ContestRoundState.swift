import Foundation

public enum SwikiContestRoundState: String, Decodable, Sendable {
    case created
    case started
    case finished
}
