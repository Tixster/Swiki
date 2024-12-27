import Foundation

/// GraphQl-модель
public struct SwikiAnime: Decodable, Sendable {
    public let id: String
    public let malId: String?
    public let name: String
    public let russian: String?
    public let licenseNameRu: String?
    public let english: String?
    public let japanese: String?
    public let synonims: [String]
    public let kind: SwikiAnimeKind
    public let rating: SwikiAnimeRating
    public let score: Float?
    public let status: SwikiAnimeStatus
    public let episodes: Int
    public let episodesAired: Int
    /// Продолжительность в минутах
    public let duration: Int?
    public let airedOn: SwikiIncompleteDate?
    public let releasedOn: SwikiIncompleteDate?
    public let url: URL
    public let season: String?
    public let poster: SwikiPoster
    public let fansubbers: [String]
    public let fandubbers: [String]
    public let licensors: [String]
    public let createdAt: Date
    public let updatedAt: Date
    public let nextEpisodeAt: Date?
    public let isCensored: Bool?
    public let genres: [SwikiGenre]?
    public let studios: [SwikiStudio]
    public let externalLinks: [SwikiExternalLink]?
    public let personRoles: [SwikiPersonRole]?
    public let characterRoles: [SwikiCharacterRole]?
    public let franchise: String?
    public let chronology: [SwikiAnime]?
    public let description: String?
    public let descriptionHtml: String?
    public let descriptionSource: String?
    public let videos: [SwikiVideo]
    public let screenshots: [SwikiScreenshot]
    public let opengraphImageUrl: URL?
    public let related: [SwikiRelated]?
    public let scoresStats: [SwikiScoreStat]?
    public let statusesStats: [SwikiUserRateStatus]?
    public let userRate: SwikiUserRate?

}
