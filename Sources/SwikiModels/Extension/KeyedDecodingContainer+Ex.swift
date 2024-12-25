import Foundation

extension KeyedDecodingContainer {
    /// Декодирует ключ как строку, если в JSON был Int — конвертирует в String.
    /// Если ни как String, ни как Int не получается — бросает ошибку.
    func decodeStringOrInt(forKey key: Key) throws -> String {
          if let stringValue = try? decode(String.self, forKey: key) {
            return stringValue
        } else if let intValue = try? decode(Int.self, forKey: key) {
            return String(intValue)
        } else {
            throw DecodingError.typeMismatch(
                String.self,
                DecodingError.Context(
                    codingPath: codingPath + [key],
                    debugDescription: "Expected String or Int for key \(key.stringValue)"
                )
            )
        }
    }
}
