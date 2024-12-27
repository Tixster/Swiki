import Foundation

public struct SwikiRelated: Decodable, Sendable {
    public let id: String
    public let relationText: String
    public let relationKind: SwikiRelationKind
    public let anime: SwikiAnime?
    public let manga: SwikiManga?
}
