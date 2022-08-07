// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct ContentTraffic: Codable {
    /// Example: "/github/hubot"
    public var path: String
    /// Example: "github/hubot: A customizable life embetterment robot."
    public var title: String
    /// Example: 3542
    public var count: Int
    /// Example: 2225
    public var uniques: Int

    public init(path: String, title: String, count: Int, uniques: Int) {
        self.path = path
        self.title = title
        self.count = count
        self.uniques = uniques
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.path = try values.decode(String.self, forKey: "path")
        self.title = try values.decode(String.self, forKey: "title")
        self.count = try values.decode(Int.self, forKey: "count")
        self.uniques = try values.decode(Int.self, forKey: "uniques")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(path, forKey: "path")
        try values.encode(title, forKey: "title")
        try values.encode(count, forKey: "count")
        try values.encode(uniques, forKey: "uniques")
    }
}
