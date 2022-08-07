// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg.Teams {
    public func teamSlug(_ teamSlug: String) -> WithTeamSlug {
        WithTeamSlug(path: "\(path)/\(teamSlug)")
    }

    public struct WithTeamSlug {
        /// Path: `/orgs/{org}/teams/{team_slug}`
        public let path: String

        /// Get a team by name
        ///
        /// Gets a team using the team's `slug`. GitHub generates the `slug` from the team `name`.
        /// 
        /// **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}`.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/teams#get-a-team-by-name)
        public var get: Request<OctoKit.TeamFull> {
            Request(method: "GET", url: path, id: "teams/get-by-name")
        }

        /// Update a team
        ///
        /// To edit a team, the authenticated user must either be an organization owner or a team maintainer.
        /// 
        /// **Note:** You can also specify a team by `org_id` and `team_id` using the route `PATCH /organizations/{org_id}/team/{team_id}`.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/teams#update-a-team)
        public func patch(_ body: PatchRequest? = nil) -> Request<OctoKit.TeamFull> {
            Request(method: "PATCH", url: path, body: body, id: "teams/update-in-org")
        }

        public struct PatchRequest: Encodable {
            /// The name of the team.
            public var name: String?
            /// The description of the team.
            public var description: String?
            /// The level of privacy this team should have. Editing teams without specifying this parameter leaves `privacy` intact. When a team is nested, the `privacy` for parent teams cannot be `secret`. The options are:  
            /// **For a non-nested team:**  
            /// \* `secret` - only visible to organization owners and members of this team.  
            /// \* `closed` - visible to all members of this organization.  
            /// **For a parent or child team:**  
            /// \* `closed` - visible to all members of this organization.
            public var privacy: Privacy?
            /// **Deprecated**. The permission that new repositories will be added to the team with when none is specified. Can be one of:  
            /// \* `pull` - team members can pull, but not push to or administer newly-added repositories.  
            /// \* `push` - team members can pull and push, but not administer newly-added repositories.  
            /// \* `admin` - team members can pull, push and administer newly-added repositories.
            public var permission: Permission?
            /// The ID of a team to set as the parent team.
            public var parentTeamID: Int?

            /// The level of privacy this team should have. Editing teams without specifying this parameter leaves `privacy` intact. When a team is nested, the `privacy` for parent teams cannot be `secret`. The options are:  
            /// **For a non-nested team:**  
            /// \* `secret` - only visible to organization owners and members of this team.  
            /// \* `closed` - visible to all members of this organization.  
            /// **For a parent or child team:**  
            /// \* `closed` - visible to all members of this organization.
            public enum Privacy: String, Codable, CaseIterable {
                case secret
                case closed
            }

            /// **Deprecated**. The permission that new repositories will be added to the team with when none is specified. Can be one of:  
            /// \* `pull` - team members can pull, but not push to or administer newly-added repositories.  
            /// \* `push` - team members can pull and push, but not administer newly-added repositories.  
            /// \* `admin` - team members can pull, push and administer newly-added repositories.
            public enum Permission: String, Codable, CaseIterable {
                case pull
                case push
                case admin
            }

            public init(name: String? = nil, description: String? = nil, privacy: Privacy? = nil, permission: Permission? = nil, parentTeamID: Int? = nil) {
                self.name = name
                self.description = description
                self.privacy = privacy
                self.permission = permission
                self.parentTeamID = parentTeamID
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(name, forKey: "name")
                try values.encodeIfPresent(description, forKey: "description")
                try values.encodeIfPresent(privacy, forKey: "privacy")
                try values.encodeIfPresent(permission, forKey: "permission")
                try values.encodeIfPresent(parentTeamID, forKey: "parent_team_id")
            }
        }

        /// Delete a team
        ///
        /// To delete a team, the authenticated user must be an organization owner or team maintainer.
        /// 
        /// If you are an organization owner, deleting a parent team will delete all of its child teams as well.
        /// 
        /// **Note:** You can also specify a team by `org_id` and `team_id` using the route `DELETE /organizations/{org_id}/team/{team_id}`.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/teams#delete-a-team)
        public var delete: Request<Void> {
            Request(method: "DELETE", url: path, id: "teams/delete-in-org")
        }
    }
}
