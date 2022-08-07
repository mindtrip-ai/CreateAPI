// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Git {
    public var commits: Commits {
        Commits(path: path + "/commits")
    }

    public struct Commits {
        /// Path: `/repos/{owner}/{repo}/git/commits`
        public let path: String

        /// Create a commit
        ///
        /// Creates a new Git [commit object](https://git-scm.com/book/en/v1/Git-Internals-Git-Objects#Commit-Objects).
        /// 
        /// **Signature verification object**
        /// 
        /// The response will include a `verification` object that describes the result of verifying the commit's signature. The following fields are included in the `verification` object:
        /// 
        /// | Name | Type | Description |
        /// | ---- | ---- | ----------- |
        /// | `verified` | `boolean` | Indicates whether GitHub considers the signature in this commit to be verified. |
        /// | `reason` | `string` | The reason for verified value. Possible values and their meanings are enumerated in table below. |
        /// | `signature` | `string` | The signature that was extracted from the commit. |
        /// | `payload` | `string` | The value that was signed. |
        /// 
        /// These are the possible values for `reason` in the `verification` object:
        /// 
        /// | Value | Description |
        /// | ----- | ----------- |
        /// | `expired_key` | The key that made the signature is expired. |
        /// | `not_signing_key` | The "signing" flag is not among the usage flags in the GPG key that made the signature. |
        /// | `gpgverify_error` | There was an error communicating with the signature verification service. |
        /// | `gpgverify_unavailable` | The signature verification service is currently unavailable. |
        /// | `unsigned` | The object does not include a signature. |
        /// | `unknown_signature_type` | A non-PGP signature was found in the commit. |
        /// | `no_user` | No user was associated with the `committer` email address in the commit. |
        /// | `unverified_email` | The `committer` email address in the commit was associated with a user, but the email address is not verified on her/his account. |
        /// | `bad_email` | The `committer` email address in the commit is not included in the identities of the PGP key that made the signature. |
        /// | `unknown_key` | The key that made the signature has not been registered with any user's account. |
        /// | `malformed_signature` | There was an error parsing the signature. |
        /// | `invalid` | The signature could not be cryptographically verified using the key whose key-id was found in the signature. |
        /// | `valid` | None of the above errors applied, so the signature is considered to be verified. |
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/git#create-a-commit)
        public func post(_ body: PostRequest) -> Request<OctoKit.GitCommit> {
            Request(method: "POST", url: path, body: body, id: "git/create-commit")
        }

        public enum PostResponseHeaders {
            public static let location = HTTPHeader<String>(field: "Location")
        }

        public struct PostRequest: Encodable {
            /// The commit message
            public var message: String
            /// The SHA of the tree object this commit points to
            public var tree: String
            /// The SHAs of the commits that were the parents of this commit. If omitted or empty, the commit will be written as a root commit. For a single parent, an array of one SHA should be provided; for a merge commit, an array of more than one should be provided.
            public var parents: [String]?
            /// Information about the author of the commit. By default, the `author` will be the authenticated user and the current date. See the `author` and `committer` object below for details.
            public var author: Author?
            /// Information about the person who is making the commit. By default, `committer` will use the information set in `author`. See the `author` and `committer` object below for details.
            public var committer: Committer?
            /// The [PGP signature](https://en.wikipedia.org/wiki/Pretty_Good_Privacy) of the commit. GitHub adds the signature to the `gpgsig` header of the created commit. For a commit signature to be verifiable by Git or GitHub, it must be an ASCII-armored detached PGP signature over the string commit as it would be written to the object database. To pass a `signature` parameter, you need to first manually create a valid PGP signature, which can be complicated. You may find it easier to [use the command line](https://git-scm.com/book/id/v2/Git-Tools-Signing-Your-Work) to create signed commits.
            public var signature: String?

            /// Information about the author of the commit. By default, the `author` will be the authenticated user and the current date. See the `author` and `committer` object below for details.
            public struct Author: Encodable {
                /// The name of the author (or committer) of the commit
                public var name: String
                /// The email of the author (or committer) of the commit
                public var email: String
                /// Indicates when this commit was authored (or committed). This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
                public var date: Date?

                public init(name: String, email: String, date: Date? = nil) {
                    self.name = name
                    self.email = email
                    self.date = date
                }

                public func encode(to encoder: Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encode(name, forKey: "name")
                    try values.encode(email, forKey: "email")
                    try values.encodeIfPresent(date, forKey: "date")
                }
            }

            /// Information about the person who is making the commit. By default, `committer` will use the information set in `author`. See the `author` and `committer` object below for details.
            public struct Committer: Encodable {
                /// The name of the author (or committer) of the commit
                public var name: String?
                /// The email of the author (or committer) of the commit
                public var email: String?
                /// Indicates when this commit was authored (or committed). This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
                public var date: Date?

                public init(name: String? = nil, email: String? = nil, date: Date? = nil) {
                    self.name = name
                    self.email = email
                    self.date = date
                }

                public func encode(to encoder: Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encodeIfPresent(name, forKey: "name")
                    try values.encodeIfPresent(email, forKey: "email")
                    try values.encodeIfPresent(date, forKey: "date")
                }
            }

            public init(message: String, tree: String, parents: [String]? = nil, author: Author? = nil, committer: Committer? = nil, signature: String? = nil) {
                self.message = message
                self.tree = tree
                self.parents = parents
                self.author = author
                self.committer = committer
                self.signature = signature
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(message, forKey: "message")
                try values.encode(tree, forKey: "tree")
                try values.encodeIfPresent(parents, forKey: "parents")
                try values.encodeIfPresent(author, forKey: "author")
                try values.encodeIfPresent(committer, forKey: "committer")
                try values.encodeIfPresent(signature, forKey: "signature")
            }
        }
    }
}
