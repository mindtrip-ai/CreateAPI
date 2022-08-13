// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct Cat: Codable {
	public var className: String
	public var color: String?
	public var isDeclawed: Bool?

	public init(className: String, color: String? = nil, isDeclawed: Bool? = nil) {
		self.className = className
		self.color = color
		self.isDeclawed = isDeclawed
	}

	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: StringCodingKey.self)
		self.className = try values.decode(String.self, forKey: "className")
		self.color = try values.decodeIfPresent(String.self, forKey: "color")
		self.isDeclawed = try values.decodeIfPresent(Bool.self, forKey: "declawed")
	}

	public func encode(to encoder: Encoder) throws {
		var values = encoder.container(keyedBy: StringCodingKey.self)
		try values.encode(className, forKey: "className")
		try values.encodeIfPresent(color, forKey: "color")
		try values.encodeIfPresent(isDeclawed, forKey: "declawed")
	}
}
