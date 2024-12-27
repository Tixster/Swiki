import Foundation

public struct SwikiStatusStat: Decodable, Sendable {
    public let count: Int
    public let status: SwikiUserRateStatus
}
