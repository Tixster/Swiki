import Foundation

public struct SwikiVideo: Decodable, Sendable {
    public let id: Int
    public let url: URL
    public let imageUrl: URL
    public let playerUrl: URL
    public let name: String?
    public let kind: SwikiVideoKind
    public let hosting: SwikiVideoHosting

    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "image_url"
        case kind
        case name
        case playerUrl = "player_url"
        case url
        case hosting
    }

}
