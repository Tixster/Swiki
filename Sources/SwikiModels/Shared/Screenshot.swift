import Foundation

public struct SwikiScreenshot: Decodable, Sendable {
    public let id: String
    public let originalUrl: URL
    public let x166Url: URL
    public let x332Url: URL
}
