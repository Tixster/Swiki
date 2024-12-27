import Foundation

public struct SwikiContestMatch: Decodable, Sendable {
    public let id: String
    public let state: SwikiContestMatchState
    public let winnderId: Int
    public let leftAnime: SwikiAnime?
    public let leftCharacter: SwikiCharacter?
    public let leftId: Int?
    public let leftVotes: Int?
    public let rightAnime: SwikiAnime?
    public let rightCharacter: SwikiCharacter?
    public let rightId: Int?
    public let rightVotes: Int?
}
