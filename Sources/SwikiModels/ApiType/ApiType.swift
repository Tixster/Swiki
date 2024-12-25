import Foundation

public enum ApiType: Sendable {
    static let value: String = "apiType"
    case rest
    case graphQL
}

public extension CodingUserInfoKey {
    static let apiType = CodingUserInfoKey(rawValue: ApiType.value)!
}

enum DecodingApiTypeError: Error {
    case missingParamKey
}

extension Decoder {

    func getApiType() throws -> ApiType {
        if let apiType = userInfo[.apiType] as? ApiType {
            return apiType
        }
        throw DecodingApiTypeError.missingParamKey
    }

}

public extension JSONDecoder {

    func set(apiType: ApiType) {
        userInfo[.apiType] = apiType
    }

}
