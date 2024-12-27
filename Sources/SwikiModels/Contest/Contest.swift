import Foundation

public struct SwikiContest: Decodable, Sendable {
    public let id: String
    public let name: String
    public let state: SwikiContestState
    public let strategyType: SwikiContestStrategyType
    public let memberType: SwikiContestMemberType
    public let rounds: [SwikiContestRound]
    public let description: String?
    public let descriptionHtml: String?
    public let descriptionSource: String?
    public let matchDuration: Int?
    public let matchesInterval: Int?
    public let matchesPerRound: Int?
}
