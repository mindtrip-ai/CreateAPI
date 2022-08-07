// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct ScimError: Codable {
    public var message: String?
    public var documentationURL: String?
    public var detail: String?
    public var status: Int?
    public var scimType: String?
    public var schemas: [String]?

    public init(message: String? = nil, documentationURL: String? = nil, detail: String? = nil, status: Int? = nil, scimType: String? = nil, schemas: [String]? = nil) {
        self.message = message
        self.documentationURL = documentationURL
        self.detail = detail
        self.status = status
        self.scimType = scimType
        self.schemas = schemas
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.message = try values.decodeIfPresent(String.self, forKey: "message")
        self.documentationURL = try values.decodeIfPresent(String.self, forKey: "documentation_url")
        self.detail = try values.decodeIfPresent(String.self, forKey: "detail")
        self.status = try values.decodeIfPresent(Int.self, forKey: "status")
        self.scimType = try values.decodeIfPresent(String.self, forKey: "scimType")
        self.schemas = try values.decodeIfPresent([String].self, forKey: "schemas")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(message, forKey: "message")
        try values.encodeIfPresent(documentationURL, forKey: "documentation_url")
        try values.encodeIfPresent(detail, forKey: "detail")
        try values.encodeIfPresent(status, forKey: "status")
        try values.encodeIfPresent(scimType, forKey: "scimType")
        try values.encodeIfPresent(schemas, forKey: "schemas")
    }
}
