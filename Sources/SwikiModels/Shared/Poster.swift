import Foundation

public struct SwikiPoster: Decodable, Sendable {
    public let id: String
    public let main2xUrl: URL
    public let mainAlt2xUrl: URL
    public let mainAltUrl: URL
    public let mainUrl: URL
    public let mini2xUrl: URL
    public let miniAlt2xUrl: URL
    public let miniAltUrl: URL
    public let miniUrl: URL
    public let originalUrl: URL
    public let preview2xUrl: URL
    public let previewAlt2xUrl: URL
    public let previewAltUrl: URL
    public let previewUrl: URL
}
