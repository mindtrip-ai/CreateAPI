// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

struct StringCodingKey: CodingKey, ExpressibleByStringLiteral {
    private let string: String
    private var int: Int?

    var stringValue: String { return string }

    init(string: String) {
        self.string = string
    }

    init?(stringValue: String) {
        self.string = stringValue
    }

    var intValue: Int? { return int }

    init?(intValue: Int) {
        self.string = String(describing: intValue)
        self.int = intValue
    }

    init(stringLiteral value: String) {
        self.string = value
    }
}

/// A pet title
///
/// A pet description
public struct Pet: Codable {
    public var id: Int
    /// Example: "Buddy"
    public var name: String
    public var tag: String?

    public init(id: Int, name: String, tag: String? = nil) {
        self.id = id
        self.name = name
        self.tag = tag
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int.self, forKey: "id")
        self.name = try values.decode(String.self, forKey: "name")
        self.tag = try values.decodeIfPresent(String.self, forKey: "tag")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(name, forKey: "name")
        try values.encodeIfPresent(tag, forKey: "tag")
    }
}

public struct Store: Codable {
    public var pets: [Pet]

    public init(pets: [Pet]) {
        self.pets = pets
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.pets = try values.decode([Pet].self, forKey: "pets")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(pets, forKey: "pets")
    }
}

public struct Error: Codable {
    public var code: Int
    public var message: String

    public init(code: Int, message: String) {
        self.code = code
        self.message = message
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.code = try values.decode(Int.self, forKey: "code")
        self.message = try values.decode(String.self, forKey: "message")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(code, forKey: "code")
        try values.encode(message, forKey: "message")
    }
}
