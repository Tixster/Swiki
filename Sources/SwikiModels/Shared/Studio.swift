import Foundation

public struct SwikiStudio: Decodable, Sendable {
    public let id: String
    public let name: String
    public let filteredName: String
    public let real: Bool
    public let image: URL?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case filteredName = "filtered_name"
        case real
        case image
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeStringOrInt(forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.filteredName = try container.decode(String.self, forKey: .filteredName)
        self.real = try container.decode(Bool.self, forKey: .real)
        self.image = try container.decodeIfPresent(URL.self, forKey: .image)
    }
    
}
