import Foundation

public struct SwikiAnime: Decodable, Sendable {
    let id: Int
    let name: String
    let russian: String
    let image: SwikiImage
    let url: URL
    let kind: SwikiAnimeKind
    let score: String
    let status: SwikiAnimeStatus
    let episodes: Int
    let episodesAired: Int
    let airedOn: String?
    let releasedOn: String?
    let rating: SwikiAnimeRating
    let english: [String]
    let japanese: [String]
    let synonims: [String]
    let licenseNameRu: String?
    let duration: Int
    let description: String?
    let descriptionHtml: String?
    let descriptionSource: String?
    let franchise: String?
    let favoured: Bool
    let anons: Bool
    let ongoing: Bool
    let threadId: Int
    let topicId: Int
    let myAnimeListId: Int
    let ratesScoresStats: [SwikiRateScore]
    let ratesStatusesStats: [SwikiRateStatus]
    let updatedAt: Date
    let nextEpisodeAt: Int?
    let fansubbers: [String]
    let fandubbers: [String]
    let licensors: [String]
    let genres: [SwikiGenre]
    let studios: [SwikiStudio]
    let videos: [SwikiVideo]
    let screenshots: [SwikiImage]
}
