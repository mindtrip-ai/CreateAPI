// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg.Actions.Permissions {
    public var repositories: Repositories {
        Repositories(path: path + "/repositories")
    }

    public struct Repositories {
        /// Path: `/orgs/{org}/actions/permissions/repositories`
        public let path: String

        /// List selected repositories enabled for GitHub Actions in an organization
        ///
        /// Lists the selected repositories that are enabled for GitHub Actions in an organization. To use this endpoint, the organization permission policy for `enabled_repositories` must be configured to `selected`. For more information, see "[Set GitHub Actions permissions for an organization](#set-github-actions-permissions-for-an-organization)."
        /// 
        /// You must authenticate using an access token with the `admin:org` scope to use this endpoint. GitHub Apps must have the `administration` organization permission to use this API.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#list-selected-repositories-enabled-for-github-actions-in-an-organization)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<GetResponse> {
            Request(method: "GET", url: path, query: makeGetQuery(perPage, page), id: "actions/list-selected-repositories-enabled-github-actions-organization")
        }

        public struct GetResponse: Decodable {
            public var totalCount: Double
            public var repositories: [OctoKit.Repository]

            public init(totalCount: Double, repositories: [OctoKit.Repository]) {
                self.totalCount = totalCount
                self.repositories = repositories
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.totalCount = try values.decode(Double.self, forKey: "total_count")
                self.repositories = try values.decode([OctoKit.Repository].self, forKey: "repositories")
            }
        }

        private func makeGetQuery(_ perPage: Int?, _ page: Int?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(perPage, forKey: "per_page")
            encoder.encode(page, forKey: "page")
            return encoder.items
        }

        /// Set selected repositories enabled for GitHub Actions in an organization
        ///
        /// Replaces the list of selected repositories that are enabled for GitHub Actions in an organization. To use this endpoint, the organization permission policy for `enabled_repositories` must be configured to `selected`. For more information, see "[Set GitHub Actions permissions for an organization](#set-github-actions-permissions-for-an-organization)."
        /// 
        /// You must authenticate using an access token with the `admin:org` scope to use this endpoint. GitHub Apps must have the `administration` organization permission to use this API.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#set-selected-repositories-enabled-for-github-actions-in-an-organization)
        public func put(selectedRepositoryIDs: [Int]) -> Request<Void> {
            Request(method: "PUT", url: path, body: ["selected_repository_ids": selectedRepositoryIDs], id: "actions/set-selected-repositories-enabled-github-actions-organization")
        }
    }
}
