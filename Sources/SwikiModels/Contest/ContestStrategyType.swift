import Foundation

public enum SwikiContestStrategyType: String, Decodable, Sendable {
    case doubleElimination = "double_elimination"
    case playOff = "play_off"
    case swiss
}
