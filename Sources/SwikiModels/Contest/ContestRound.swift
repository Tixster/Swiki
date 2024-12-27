import Foundation

public struct SwikiContestRound: Decodable, Sendable {
    public let id: String
    public let name: String
    public let number: Int
    public let isAdditional: Bool
    public let state: SwikiContestRoundState
    public let matches: [SwikiContestMatch]
}
