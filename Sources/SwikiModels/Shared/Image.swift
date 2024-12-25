import Foundation

public struct SwikiImage: Decodable, Sendable {
    public let original: URL
    public let preview: URL
    public let x96: URL?
    public let x48: URL?
}
