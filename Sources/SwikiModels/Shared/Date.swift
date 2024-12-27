import Foundation

public struct SwikiIncompleteDate: Decodable, Sendable {
    public let year: Int?
    public let month: Int?
    public let day: Int?
    public let date: Date?

    enum CodingKeys: String, CodingKey {
        case year
        case month
        case day
        case date
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.year = try container.decodeIfPresent(Int.self, forKey: .year)
        self.month = try container.decodeIfPresent(Int.self, forKey: .month)
        self.day = try container.decodeIfPresent(Int.self, forKey: .day)
        let dateStr = try container.decodeIfPresent(String.self, forKey: .date)
        self.date = if let dateStr {
            DateFormatter.yyyyMMdd.date(from: dateStr)
        } else {
            nil
        }
    }

}
