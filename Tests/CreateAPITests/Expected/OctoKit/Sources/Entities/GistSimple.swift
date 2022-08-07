// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct GistSimple: Codable {
    /// - warning: Deprecated.
    public var forks: [Fork]?
    /// - warning: Deprecated.
    public var history: [GistHistory]?
    /// Gist
    public var forkOf: ForkOf?
    public var url: String?
    public var forksURL: String?
    public var commitsURL: String?
    public var id: String?
    public var nodeID: String?
    public var gitPullURL: String?
    public var gitPushURL: String?
    public var htmlURL: String?
    public var files: [String: File]?
    public var isPublic: Bool?
    public var createdAt: String?
    public var updatedAt: String?
    public var description: String?
    public var comments: Int?
    public var user: String?
    public var commentsURL: String?
    /// Simple User
    public var owner: SimpleUser?
    public var isTruncated: Bool?

    public struct Fork: Codable {
        public var id: String?
        public var url: URL?
        /// Public User
        public var user: PublicUser?
        public var createdAt: Date?
        public var updatedAt: Date?

        public init(id: String? = nil, url: URL? = nil, user: PublicUser? = nil, createdAt: Date? = nil, updatedAt: Date? = nil) {
            self.id = id
            self.url = url
            self.user = user
            self.createdAt = createdAt
            self.updatedAt = updatedAt
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.id = try values.decodeIfPresent(String.self, forKey: "id")
            self.url = try values.decodeIfPresent(URL.self, forKey: "url")
            self.user = try values.decodeIfPresent(PublicUser.self, forKey: "user")
            self.createdAt = try values.decodeIfPresent(Date.self, forKey: "created_at")
            self.updatedAt = try values.decodeIfPresent(Date.self, forKey: "updated_at")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(id, forKey: "id")
            try values.encodeIfPresent(url, forKey: "url")
            try values.encodeIfPresent(user, forKey: "user")
            try values.encodeIfPresent(createdAt, forKey: "created_at")
            try values.encodeIfPresent(updatedAt, forKey: "updated_at")
        }
    }

    /// Gist
    public struct ForkOf: Codable {
        public var url: URL
        public var forksURL: URL
        public var commitsURL: URL
        public var id: String
        public var nodeID: String
        public var gitPullURL: URL
        public var gitPushURL: URL
        public var htmlURL: URL
        public var files: [String: File]
        public var isPublic: Bool
        public var createdAt: Date
        public var updatedAt: Date
        public var description: String?
        public var comments: Int
        /// Simple User
        public var user: SimpleUser?
        public var commentsURL: URL
        /// Simple User
        public var owner: SimpleUser?
        public var isTruncated: Bool?
        public var forks: [AnyJSON]?
        public var history: [AnyJSON]?

        public struct File: Codable {
            public var filename: String?
            public var type: String?
            public var language: String?
            public var rawURL: String?
            public var size: Int?

            public init(filename: String? = nil, type: String? = nil, language: String? = nil, rawURL: String? = nil, size: Int? = nil) {
                self.filename = filename
                self.type = type
                self.language = language
                self.rawURL = rawURL
                self.size = size
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.filename = try values.decodeIfPresent(String.self, forKey: "filename")
                self.type = try values.decodeIfPresent(String.self, forKey: "type")
                self.language = try values.decodeIfPresent(String.self, forKey: "language")
                self.rawURL = try values.decodeIfPresent(String.self, forKey: "raw_url")
                self.size = try values.decodeIfPresent(Int.self, forKey: "size")
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(filename, forKey: "filename")
                try values.encodeIfPresent(type, forKey: "type")
                try values.encodeIfPresent(language, forKey: "language")
                try values.encodeIfPresent(rawURL, forKey: "raw_url")
                try values.encodeIfPresent(size, forKey: "size")
            }
        }

        public init(url: URL, forksURL: URL, commitsURL: URL, id: String, nodeID: String, gitPullURL: URL, gitPushURL: URL, htmlURL: URL, files: [String: File], isPublic: Bool, createdAt: Date, updatedAt: Date, description: String? = nil, comments: Int, user: SimpleUser? = nil, commentsURL: URL, owner: SimpleUser? = nil, isTruncated: Bool? = nil, forks: [AnyJSON]? = nil, history: [AnyJSON]? = nil) {
            self.url = url
            self.forksURL = forksURL
            self.commitsURL = commitsURL
            self.id = id
            self.nodeID = nodeID
            self.gitPullURL = gitPullURL
            self.gitPushURL = gitPushURL
            self.htmlURL = htmlURL
            self.files = files
            self.isPublic = isPublic
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.description = description
            self.comments = comments
            self.user = user
            self.commentsURL = commentsURL
            self.owner = owner
            self.isTruncated = isTruncated
            self.forks = forks
            self.history = history
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.url = try values.decode(URL.self, forKey: "url")
            self.forksURL = try values.decode(URL.self, forKey: "forks_url")
            self.commitsURL = try values.decode(URL.self, forKey: "commits_url")
            self.id = try values.decode(String.self, forKey: "id")
            self.nodeID = try values.decode(String.self, forKey: "node_id")
            self.gitPullURL = try values.decode(URL.self, forKey: "git_pull_url")
            self.gitPushURL = try values.decode(URL.self, forKey: "git_push_url")
            self.htmlURL = try values.decode(URL.self, forKey: "html_url")
            self.files = try values.decode([String: File].self, forKey: "files")
            self.isPublic = try values.decode(Bool.self, forKey: "public")
            self.createdAt = try values.decode(Date.self, forKey: "created_at")
            self.updatedAt = try values.decode(Date.self, forKey: "updated_at")
            self.description = try values.decodeIfPresent(String.self, forKey: "description")
            self.comments = try values.decode(Int.self, forKey: "comments")
            self.user = try values.decodeIfPresent(SimpleUser.self, forKey: "user")
            self.commentsURL = try values.decode(URL.self, forKey: "comments_url")
            self.owner = try values.decodeIfPresent(SimpleUser.self, forKey: "owner")
            self.isTruncated = try values.decodeIfPresent(Bool.self, forKey: "truncated")
            self.forks = try values.decodeIfPresent([AnyJSON].self, forKey: "forks")
            self.history = try values.decodeIfPresent([AnyJSON].self, forKey: "history")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(url, forKey: "url")
            try values.encode(forksURL, forKey: "forks_url")
            try values.encode(commitsURL, forKey: "commits_url")
            try values.encode(id, forKey: "id")
            try values.encode(nodeID, forKey: "node_id")
            try values.encode(gitPullURL, forKey: "git_pull_url")
            try values.encode(gitPushURL, forKey: "git_push_url")
            try values.encode(htmlURL, forKey: "html_url")
            try values.encode(files, forKey: "files")
            try values.encode(isPublic, forKey: "public")
            try values.encode(createdAt, forKey: "created_at")
            try values.encode(updatedAt, forKey: "updated_at")
            try values.encodeIfPresent(description, forKey: "description")
            try values.encode(comments, forKey: "comments")
            try values.encodeIfPresent(user, forKey: "user")
            try values.encode(commentsURL, forKey: "comments_url")
            try values.encodeIfPresent(owner, forKey: "owner")
            try values.encodeIfPresent(isTruncated, forKey: "truncated")
            try values.encodeIfPresent(forks, forKey: "forks")
            try values.encodeIfPresent(history, forKey: "history")
        }
    }

    public struct File: Codable {
        public var filename: String?
        public var type: String?
        public var language: String?
        public var rawURL: String?
        public var size: Int?
        public var isTruncated: Bool?
        public var content: String?

        public init(filename: String? = nil, type: String? = nil, language: String? = nil, rawURL: String? = nil, size: Int? = nil, isTruncated: Bool? = nil, content: String? = nil) {
            self.filename = filename
            self.type = type
            self.language = language
            self.rawURL = rawURL
            self.size = size
            self.isTruncated = isTruncated
            self.content = content
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.filename = try values.decodeIfPresent(String.self, forKey: "filename")
            self.type = try values.decodeIfPresent(String.self, forKey: "type")
            self.language = try values.decodeIfPresent(String.self, forKey: "language")
            self.rawURL = try values.decodeIfPresent(String.self, forKey: "raw_url")
            self.size = try values.decodeIfPresent(Int.self, forKey: "size")
            self.isTruncated = try values.decodeIfPresent(Bool.self, forKey: "truncated")
            self.content = try values.decodeIfPresent(String.self, forKey: "content")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(filename, forKey: "filename")
            try values.encodeIfPresent(type, forKey: "type")
            try values.encodeIfPresent(language, forKey: "language")
            try values.encodeIfPresent(rawURL, forKey: "raw_url")
            try values.encodeIfPresent(size, forKey: "size")
            try values.encodeIfPresent(isTruncated, forKey: "truncated")
            try values.encodeIfPresent(content, forKey: "content")
        }
    }

    public init(forks: [Fork]? = nil, history: [GistHistory]? = nil, forkOf: ForkOf? = nil, url: String? = nil, forksURL: String? = nil, commitsURL: String? = nil, id: String? = nil, nodeID: String? = nil, gitPullURL: String? = nil, gitPushURL: String? = nil, htmlURL: String? = nil, files: [String: File]? = nil, isPublic: Bool? = nil, createdAt: String? = nil, updatedAt: String? = nil, description: String? = nil, comments: Int? = nil, user: String? = nil, commentsURL: String? = nil, owner: SimpleUser? = nil, isTruncated: Bool? = nil) {
        self.forks = forks
        self.history = history
        self.forkOf = forkOf
        self.url = url
        self.forksURL = forksURL
        self.commitsURL = commitsURL
        self.id = id
        self.nodeID = nodeID
        self.gitPullURL = gitPullURL
        self.gitPushURL = gitPushURL
        self.htmlURL = htmlURL
        self.files = files
        self.isPublic = isPublic
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.description = description
        self.comments = comments
        self.user = user
        self.commentsURL = commentsURL
        self.owner = owner
        self.isTruncated = isTruncated
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.forks = try values.decodeIfPresent([Fork].self, forKey: "forks")
        self.history = try values.decodeIfPresent([GistHistory].self, forKey: "history")
        self.forkOf = try values.decodeIfPresent(ForkOf.self, forKey: "fork_of")
        self.url = try values.decodeIfPresent(String.self, forKey: "url")
        self.forksURL = try values.decodeIfPresent(String.self, forKey: "forks_url")
        self.commitsURL = try values.decodeIfPresent(String.self, forKey: "commits_url")
        self.id = try values.decodeIfPresent(String.self, forKey: "id")
        self.nodeID = try values.decodeIfPresent(String.self, forKey: "node_id")
        self.gitPullURL = try values.decodeIfPresent(String.self, forKey: "git_pull_url")
        self.gitPushURL = try values.decodeIfPresent(String.self, forKey: "git_push_url")
        self.htmlURL = try values.decodeIfPresent(String.self, forKey: "html_url")
        self.files = try values.decodeIfPresent([String: File].self, forKey: "files")
        self.isPublic = try values.decodeIfPresent(Bool.self, forKey: "public")
        self.createdAt = try values.decodeIfPresent(String.self, forKey: "created_at")
        self.updatedAt = try values.decodeIfPresent(String.self, forKey: "updated_at")
        self.description = try values.decodeIfPresent(String.self, forKey: "description")
        self.comments = try values.decodeIfPresent(Int.self, forKey: "comments")
        self.user = try values.decodeIfPresent(String.self, forKey: "user")
        self.commentsURL = try values.decodeIfPresent(String.self, forKey: "comments_url")
        self.owner = try values.decodeIfPresent(SimpleUser.self, forKey: "owner")
        self.isTruncated = try values.decodeIfPresent(Bool.self, forKey: "truncated")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(forks, forKey: "forks")
        try values.encodeIfPresent(history, forKey: "history")
        try values.encodeIfPresent(forkOf, forKey: "fork_of")
        try values.encodeIfPresent(url, forKey: "url")
        try values.encodeIfPresent(forksURL, forKey: "forks_url")
        try values.encodeIfPresent(commitsURL, forKey: "commits_url")
        try values.encodeIfPresent(id, forKey: "id")
        try values.encodeIfPresent(nodeID, forKey: "node_id")
        try values.encodeIfPresent(gitPullURL, forKey: "git_pull_url")
        try values.encodeIfPresent(gitPushURL, forKey: "git_push_url")
        try values.encodeIfPresent(htmlURL, forKey: "html_url")
        try values.encodeIfPresent(files, forKey: "files")
        try values.encodeIfPresent(isPublic, forKey: "public")
        try values.encodeIfPresent(createdAt, forKey: "created_at")
        try values.encodeIfPresent(updatedAt, forKey: "updated_at")
        try values.encodeIfPresent(description, forKey: "description")
        try values.encodeIfPresent(comments, forKey: "comments")
        try values.encodeIfPresent(user, forKey: "user")
        try values.encodeIfPresent(commentsURL, forKey: "comments_url")
        try values.encodeIfPresent(owner, forKey: "owner")
        try values.encodeIfPresent(isTruncated, forKey: "truncated")
    }
}
