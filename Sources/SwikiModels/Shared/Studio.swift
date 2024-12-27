import Foundation

/**
 - warning: Поля ``filteredName`` и ``real``
 могут иметь значение только через API V1
 */
public struct SwikiStudio: Decodable, Sendable {
    public let id: String
    public let name: String
    public let imageUrl: URL?
    public let filteredName: String?
    public let real: Bool?

    enum CodingKeysRest: String, CodingKey {
        case id
        case name
        case filteredName = "filtered_name"
        case real
        case imageUrl = "image"
    }

    enum CodingKeysGraphQl: String, CodingKey {
        case id
        case name
        case imageUrl
    }

    public init(from decoder: any Decoder) throws {
        let apiType = try decoder.getApiType()
        if apiType == .rest {
            let container = try decoder.container(keyedBy: CodingKeysRest.self)
            self.id = try container.decodeStringOrInt(forKey: .id)
            self.name = try container.decode(String.self, forKey: .name)
            self.filteredName = try container.decode(String.self, forKey: .filteredName)
            self.real = try container.decode(Bool.self, forKey: .real)
            self.imageUrl = try container.decodeIfPresent(URL.self, forKey: .imageUrl)
        } else {
            let container = try decoder.container(keyedBy: CodingKeysGraphQl.self)
            self.id = try container.decodeStringOrInt(forKey: .id)
            self.name = try container.decode(String.self, forKey: .name)
            self.imageUrl = try container.decodeIfPresent(URL.self, forKey: .imageUrl)
            self.filteredName = nil
            self.real = nil
        }

    }
    
}
