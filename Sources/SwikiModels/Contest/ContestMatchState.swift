import Foundation

public enum SwikiContestMatchState: String, Decodable, Sendable {
    case created
    case started
    case freezed
    case finished
}
