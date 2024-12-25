import Foundation

public struct SwikiAnime: Decodable, Sendable {
    public let id: String
    public let name: String
    public let russian: String
    public let image: SwikiImage
    public let url: URL
    public let kind: SwikiAnimeKind
    public let score: String
    public let status: SwikiAnimeStatus
    public let episodes: Int
    public let episodesAired: Int
    public let airedOn: String?
    public let releasedOn: String?
    public let rating: SwikiAnimeRating
    public let english: [String]
    public let japanese: [String]
    public let synonims: [String]
    public let licenseNameRu: String?
    public let duration: Int
    public let description: String?
    public let descriptionHtml: String?
    public let descriptionSource: String?
    public let franchise: String?
    public let favoured: Bool
    public let anons: Bool
    public let ongoing: Bool
    public let threadId: String
    public let topicId: String
    public let myAnimeListId: String
    public let ratesScoresStats: [SwikiRateScore]
    public let ratesStatusesStats: [SwikiRateStatus]
    public let updatedAt: Date
    public let nextEpisodeAt: Int?
    public let fansubbers: [String]
    public let fandubbers: [String]
    public let licensors: [String]
    public let genres: [SwikiGenre]
    public let studios: [SwikiStudio]
    public let videos: [SwikiVideo]
    public let screenshots: [SwikiImage]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case russian
        case image
        case url
        case kind
        case score
        case status
        case episodes
        case episodesAired = "episodes_aired"
        case airedOn = "aired_on"
        case releasedOn = "released_on"
        case rating
        case english
        case japanese
        case synonims
        case licenseNameRu = "license_name_ru"
        case duration
        case description
        case descriptionHtml = "description_html"
        case descriptionSource = "description_source"
        case franchise
        case favoured
        case anons
        case ongoing
        case threadId = "thread_id"
        case topicId = "topic_id"
        case myAnimeListId = "myanimelist_id"
        case ratesScoresStats = "rates_scores_stats"
        case ratesStatusesStats = "rates_statuses_stats"
        case updatedAt = "updated_at"
        case nextEpisodeAt = "next_episode_at"
        case fansubbers
        case fandubbers
        case licensors
        case genres
        case studios
        case videos
        case screenshots
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeStringOrInt(forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.russian = try container.decode(String.self, forKey: .russian)
        self.image = try container.decode(SwikiImage.self, forKey: .image)
        self.url = try container.decode(URL.self, forKey: .url)
        self.kind = try container.decode(SwikiAnimeKind.self, forKey: .kind)
        self.score = try container.decode(String.self, forKey: .score)
        self.status = try container.decode(SwikiAnimeStatus.self, forKey: .status)
        self.episodes = try container.decode(Int.self, forKey: .episodes)
        self.episodesAired = try container.decode(Int.self, forKey: .episodesAired)
        self.airedOn = try container.decodeIfPresent(String.self, forKey: .airedOn)
        self.releasedOn = try container.decodeIfPresent(String.self, forKey: .releasedOn)
        self.rating = try container.decode(SwikiAnimeRating.self, forKey: .rating)
        self.english = try container.decode([String].self, forKey: .english)
        self.japanese = try container.decode([String].self, forKey: .japanese)
        self.synonims = try container.decode([String].self, forKey: .synonims)
        self.licenseNameRu = try container.decodeIfPresent(String.self, forKey: .licenseNameRu)
        self.duration = try container.decode(Int.self, forKey: .duration)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.descriptionHtml = try container.decodeIfPresent(String.self, forKey: .descriptionHtml)
        self.descriptionSource = try container.decodeIfPresent(String.self, forKey: .descriptionSource)
        self.franchise = try container.decodeIfPresent(String.self, forKey: .franchise)
        self.favoured = try container.decode(Bool.self, forKey: .favoured)
        self.anons = try container.decode(Bool.self, forKey: .anons)
        self.ongoing = try container.decode(Bool.self, forKey: .ongoing)
        self.threadId = try container.decodeStringOrInt(forKey: .threadId)
        self.topicId = try container.decodeStringOrInt(forKey: .topicId)
        self.myAnimeListId = try container.decodeStringOrInt(forKey: .myAnimeListId)
        self.ratesScoresStats = try container.decode([SwikiRateScore].self, forKey: .ratesScoresStats)
        self.ratesStatusesStats = try container.decode([SwikiRateStatus].self, forKey: .ratesStatusesStats)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.nextEpisodeAt = try container.decodeIfPresent(Int.self, forKey: .nextEpisodeAt)
        self.fansubbers = try container.decode([String].self, forKey: .fansubbers)
        self.fandubbers = try container.decode([String].self, forKey: .fandubbers)
        self.licensors = try container.decode([String].self, forKey: .licensors)
        self.genres = try container.decode([SwikiGenre].self, forKey: .genres)
        self.studios = try container.decode([SwikiStudio].self, forKey: .studios)
        self.videos = try container.decode([SwikiVideo].self, forKey: .videos)
        self.screenshots = try container.decode([SwikiImage].self, forKey: .screenshots)
    }

}
