// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Environment Approval
///
/// An entry in the reviews log for environment deployments
public struct EnvironmentApprovals: Codable {
    /// The list of environments that were approved or rejected
    public var environments: [Environment]
    /// Whether deployment to the environment(s) was approved or rejected
    ///
    /// Example: "approved"
    public var state: State
    /// Simple User
    public var user: SimpleUser
    /// The comment submitted with the deployment review
    ///
    /// Example: "Ship it!"
    public var comment: String

    public struct Environment: Codable {
        /// The id of the environment.
        ///
        /// Example: 56780428
        public var id: Int?
        /// Example: "MDExOkVudmlyb25tZW50NTY3ODA0Mjg="
        public var nodeID: String?
        /// The name of the environment.
        ///
        /// Example: "staging"
        public var name: String?
        /// Example: "https://api.github.com/repos/github/hello-world/environments/staging"
        public var url: String?
        /// Example: "https://github.com/github/hello-world/deployments/activity_log?environments_filter=staging"
        public var htmlURL: String?
        /// The time that the environment was created, in ISO 8601 format.
        ///
        /// Example: "2020-11-23T22:00:40Z"
        public var createdAt: Date?
        /// The time that the environment was last updated, in ISO 8601 format.
        ///
        /// Example: "2020-11-23T22:00:40Z"
        public var updatedAt: Date?

        public init(id: Int? = nil, nodeID: String? = nil, name: String? = nil, url: String? = nil, htmlURL: String? = nil, createdAt: Date? = nil, updatedAt: Date? = nil) {
            self.id = id
            self.nodeID = nodeID
            self.name = name
            self.url = url
            self.htmlURL = htmlURL
            self.createdAt = createdAt
            self.updatedAt = updatedAt
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.id = try values.decodeIfPresent(Int.self, forKey: "id")
            self.nodeID = try values.decodeIfPresent(String.self, forKey: "node_id")
            self.name = try values.decodeIfPresent(String.self, forKey: "name")
            self.url = try values.decodeIfPresent(String.self, forKey: "url")
            self.htmlURL = try values.decodeIfPresent(String.self, forKey: "html_url")
            self.createdAt = try values.decodeIfPresent(Date.self, forKey: "created_at")
            self.updatedAt = try values.decodeIfPresent(Date.self, forKey: "updated_at")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(id, forKey: "id")
            try values.encodeIfPresent(nodeID, forKey: "node_id")
            try values.encodeIfPresent(name, forKey: "name")
            try values.encodeIfPresent(url, forKey: "url")
            try values.encodeIfPresent(htmlURL, forKey: "html_url")
            try values.encodeIfPresent(createdAt, forKey: "created_at")
            try values.encodeIfPresent(updatedAt, forKey: "updated_at")
        }
    }

    /// Whether deployment to the environment(s) was approved or rejected
    ///
    /// Example: "approved"
    public enum State: String, Codable, CaseIterable {
        case approved
        case rejected
    }

    public init(environments: [Environment], state: State, user: SimpleUser, comment: String) {
        self.environments = environments
        self.state = state
        self.user = user
        self.comment = comment
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.environments = try values.decode([Environment].self, forKey: "environments")
        self.state = try values.decode(State.self, forKey: "state")
        self.user = try values.decode(SimpleUser.self, forKey: "user")
        self.comment = try values.decode(String.self, forKey: "comment")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(environments, forKey: "environments")
        try values.encode(state, forKey: "state")
        try values.encode(user, forKey: "user")
        try values.encode(comment, forKey: "comment")
    }
}
