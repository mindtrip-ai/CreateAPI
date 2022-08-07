// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct AdvancedSecurityActiveCommitters: Codable {
    /// Example: 25
    public var totalAdvancedSecurityCommitters: Int?
    public var repositories: [AdvancedSecurityActiveCommittersRepository]

    public init(totalAdvancedSecurityCommitters: Int? = nil, repositories: [AdvancedSecurityActiveCommittersRepository]) {
        self.totalAdvancedSecurityCommitters = totalAdvancedSecurityCommitters
        self.repositories = repositories
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.totalAdvancedSecurityCommitters = try values.decodeIfPresent(Int.self, forKey: "total_advanced_security_committers")
        self.repositories = try values.decode([AdvancedSecurityActiveCommittersRepository].self, forKey: "repositories")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(totalAdvancedSecurityCommitters, forKey: "total_advanced_security_committers")
        try values.encode(repositories, forKey: "repositories")
    }
}
