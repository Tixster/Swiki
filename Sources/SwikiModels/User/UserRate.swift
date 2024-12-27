import Foundation

public struct SwikiUserRate: Decodable, Sendable {
    public let id: String
    public let episodes: Int
    public let volumes: Int
    public let chapters: Int
    public let rewatches: Int
    public let status: SwikiUserRateStatus
    public let score: Int
    public let text: String?
    public let createdAt: Date
    public let updatedAt: Date
}
