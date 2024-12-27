import Foundation

public struct SwikiExternalLink: Decodable, Sendable {
    public let id: String?
    public let kind: SwikiExternalLinkKind
    public let url: URL
    public let createdAt: Date?
    public let updatedAt: Date?
}
