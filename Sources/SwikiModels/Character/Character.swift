import Foundation

public struct SwikiCharacter: Decodable, Sendable {
    public let id: String
    public let malId: String?
    public let name: String
    public let russian: String?
    public let synonyms: [String]
    public let poster: SwikiPoster?
    public let url: URL
    public let topic: SwikiTopic?
    public let description: String?
    public let descriptionHtml: String?
    public let descriptionSource: String?
    public let createdAt: Date
    public let updatedAt: Date
}
