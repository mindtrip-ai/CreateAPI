// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct CommitComparison: Codable {
    /// Example: "https://api.github.com/repos/octocat/Hello-World/compare/master...topic"
    public var url: URL
    /// Example: "https://github.com/octocat/Hello-World/compare/master...topic"
    public var htmlURL: URL
    /// Example: "https://github.com/octocat/Hello-World/compare/octocat:bbcd538c8e72b8c175046e27cc8f907076331401...octocat:0328041d1152db8ae77652d1618a02e57f745f17"
    public var permalinkURL: URL
    /// Example: "https://github.com/octocat/Hello-World/compare/master...topic.diff"
    public var diffURL: URL
    /// Example: "https://github.com/octocat/Hello-World/compare/master...topic.patch"
    public var patchURL: URL
    /// Commit
    public var baseCommit: Commit
    /// Commit
    public var mergeBaseCommit: Commit
    /// Example: "ahead"
    public var status: Status
    public var aheadBy: Int
    public var behindBy: Int
    public var totalCommits: Int
    public var commits: [Commit]
    public var files: [DiffEntry]?

    /// Example: "ahead"
    public enum Status: String, Codable, CaseIterable {
        case diverged
        case ahead
        case behind
        case identical
    }

    public init(url: URL, htmlURL: URL, permalinkURL: URL, diffURL: URL, patchURL: URL, baseCommit: Commit, mergeBaseCommit: Commit, status: Status, aheadBy: Int, behindBy: Int, totalCommits: Int, commits: [Commit], files: [DiffEntry]? = nil) {
        self.url = url
        self.htmlURL = htmlURL
        self.permalinkURL = permalinkURL
        self.diffURL = diffURL
        self.patchURL = patchURL
        self.baseCommit = baseCommit
        self.mergeBaseCommit = mergeBaseCommit
        self.status = status
        self.aheadBy = aheadBy
        self.behindBy = behindBy
        self.totalCommits = totalCommits
        self.commits = commits
        self.files = files
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.url = try values.decode(URL.self, forKey: "url")
        self.htmlURL = try values.decode(URL.self, forKey: "html_url")
        self.permalinkURL = try values.decode(URL.self, forKey: "permalink_url")
        self.diffURL = try values.decode(URL.self, forKey: "diff_url")
        self.patchURL = try values.decode(URL.self, forKey: "patch_url")
        self.baseCommit = try values.decode(Commit.self, forKey: "base_commit")
        self.mergeBaseCommit = try values.decode(Commit.self, forKey: "merge_base_commit")
        self.status = try values.decode(Status.self, forKey: "status")
        self.aheadBy = try values.decode(Int.self, forKey: "ahead_by")
        self.behindBy = try values.decode(Int.self, forKey: "behind_by")
        self.totalCommits = try values.decode(Int.self, forKey: "total_commits")
        self.commits = try values.decode([Commit].self, forKey: "commits")
        self.files = try values.decodeIfPresent([DiffEntry].self, forKey: "files")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(url, forKey: "url")
        try values.encode(htmlURL, forKey: "html_url")
        try values.encode(permalinkURL, forKey: "permalink_url")
        try values.encode(diffURL, forKey: "diff_url")
        try values.encode(patchURL, forKey: "patch_url")
        try values.encode(baseCommit, forKey: "base_commit")
        try values.encode(mergeBaseCommit, forKey: "merge_base_commit")
        try values.encode(status, forKey: "status")
        try values.encode(aheadBy, forKey: "ahead_by")
        try values.encode(behindBy, forKey: "behind_by")
        try values.encode(totalCommits, forKey: "total_commits")
        try values.encode(commits, forKey: "commits")
        try values.encodeIfPresent(files, forKey: "files")
    }
}
