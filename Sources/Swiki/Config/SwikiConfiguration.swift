import Foundation

public struct SwikiConfiguration: Sendable {
    /// OAuth2 Credentials
    ///
    /// Брать отсюда https://shikimori.one/oauth/applications/ID-приложения/edit
    public let clientId: String?
    public let userAgent: String
    public let isRpsRpmRestrictionsEnabled: Bool

    public init(
        clientId: String? = nil,
        userAgent: String,
        isRpsRpmRestrictionsEnabled: Bool = true
    ) {
        self.clientId = clientId
        self.userAgent = userAgent
        self.isRpsRpmRestrictionsEnabled = isRpsRpmRestrictionsEnabled
    }

}
