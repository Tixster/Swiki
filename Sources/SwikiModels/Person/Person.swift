import Foundation

public struct SwikiPerson: Decodable, Sendable {
    public let id: String
    public let malId: String?
    public let name: String
    public let russian: String?
    public let japanese: String?
    public let synonyms: [String]
    public let url: URL
    public let website: URL?
    public let poster: SwikiPoster?
    public let isMangaka: Bool
    public let isProducer: Bool
    public let isSeyu: Bool
    public let topic: SwikiTopic?
    public let birthOn: SwikiIncompleteDate?
    public let deceasedOn: SwikiIncompleteDate?
    public let createdAt: Date
    public let updatedAt: Date
}
