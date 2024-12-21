import Foundation

public enum SwikiAnimeDuration: String, Codable, Sendable {
    /// API версия: "S"
    case lessThan10Minutes
    /// API версия: "D"
    case lessThan30Minutes
    /// API версия: "F"
    case moreThan30Hour

    enum CodingKeys: String, CodingKey {
        case lessThan10Minutes = "S"
        case lessThan30Minutes = "D"
        case moreThan30Hour = "F"
    }

}
