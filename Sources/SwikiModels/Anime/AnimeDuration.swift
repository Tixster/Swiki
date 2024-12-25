import Foundation

public enum SwikiAnimeDuration: String, Codable, Sendable {
    /// API версия: "S"
    case lessThan10Minutes = "S"
    /// API версия: "D"
    case lessThan30Minutes = "D"
    /// API версия: "F"
    case moreThan30Hour = "F"
}
