import XCTest
@testable import create_api

final class GenerateTests: GenerateTestCase {
    func testPestore() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-default"
        )
    }
    
    func testEdgecases() throws {
        try snapshot(
            spec: .edgecases,
            name: "edgecases-default"
        )
    }

    func testInlining() throws {
        try snapshot(
            spec: .inlining,
            name: "inlining-default",
            configuration: """
            entities:
              inlineReferencedSchemas: true
              typeOverrides:
                Letter: finalClass
            """
        )
    }

    func testDiscriminator() throws {
        try snapshot(
            spec: .discriminator,
            name: "discriminator"
        )
    }

    func testAbstractProtocol() throws {
        try snapshot(
            spec: .abstractProtocol,
            name: "abstract-protocol",
            configuration: """
            entities:
              generateProtocolFromAbstract:
                - AbstractMessage
                - BaseTransitPoint
            """
        )
    }

    /// Tests that rename.entities correctly propagates to type references
    /// (e.g. GetMessageResponse.message should use the renamed type).
    func testAbstractProtocolRenameOnly() throws {
        try snapshot(
            spec: .abstractProtocol,
            name: "abstract-protocol-rename-only",
            configuration: """
            rename:
              entities:
                Message: AnyMessage
            """
        )
    }

    /// Tests that a single user rename (Message -> ServerMessage) produces AnyServerMessage,
    /// since no other oneOf claims the "Message" name via rename.
    func testAbstractProtocolRenameWithProtocol() throws {
        try snapshot(
            spec: .abstractProtocol,
            name: "abstract-protocol-rename-with-protocol",
            configuration: """
            rename:
              entities:
                Message: ServerMessage
            entities:
              generateProtocolFromAbstract:
                - AbstractMessage
                - BaseTransitPoint
            """
        )
    }

    /// Tests the rename-swap scenario: UiMessage -> Message, Message -> ServerMessage,
    /// ServerMessage excluded. The UiMessage oneOf should become AnyMessage (its post-rename
    /// name "Message" matches baseName), not AnyUiMessage.
    func testAbstractProtocolRenameSwap() throws {
        try snapshot(
            spec: .abstractProtocol,
            name: "abstract-protocol-rename-swap",
            configuration: """
            rename:
              entities:
                Message: ServerMessage
                UiMessage: Message
            entities:
              exclude:
                - ServerMessage
              generateProtocolFromAbstract:
                - AbstractMessage
                - BaseTransitPoint
            """
        )
    }

    /// Regression: when overlapping oneOf enums all conform to the shared protocol
    /// (via excludeUnknownCase), their generated `toAny*` conversions must not recurse.
    /// Subset -> superset uses a direct switch; superset -> subset is omitted.
    func testAbstractProtocolOverlappingEnums() throws {
        try snapshot(
            spec: .abstractProtocol,
            name: "abstract-protocol-overlapping-enums",
            configuration: """
            entities:
              generateProtocolFromAbstract:
                - AbstractMessage
                - BaseTransitPoint
              excludeUnknownCase:
                - AnyMessage
                - AnyUiMessage
                - AnyPriorityMessage
                - AnyTransitPoint
            """
        )
    }

    
    func testGitHub() throws {
        try snapshot(
            spec: .github,
            name: "OctoKit",
            arguments: [
                "--strict"
            ],
            configuration: """
            vendor: github
            paths:
              overriddenResponses:
                accepted: "Void"
              overriddenBodyTypes:
                application/octocat-stream: String
            entities:
              inlineReferencedSchemas: false
            rename:
              enumCases:
                reactions-+1: "reactionsPlusOne"
                reactions--1: "reactionsMinusOne"
            """
        )
    }

    func testCookpad() throws {
        try snapshot(
            spec: .cookpad,
            name: "cookpad"
        )
    }
}
