import Foundation

public struct SwikiGenre: Decodable, Sendable {
    public let id: String
    public let name: String
    public let russian: String
    public let kind: String
    public let entryType: SwikiGenreType

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case russian
        case kind
        case entryType = "entry_type"
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeStringOrInt(forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.russian = try container.decode(String.self, forKey: .russian)
        self.kind = try container.decode(String.self, forKey: .kind)
        self.entryType = try container.decode(SwikiGenreType.self, forKey: .entryType)
    }

}
