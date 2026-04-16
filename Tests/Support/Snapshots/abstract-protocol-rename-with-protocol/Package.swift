// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "abstract-protocol-rename-with-protocol",
    platforms: [.iOS(.v13), .macCatalyst(.v13), .macOS(.v10_15), .watchOS(.v6), .tvOS(.v13)],
    products: [
        .library(name: "abstract-protocol-rename-with-protocol", targets: ["abstract-protocol-rename-with-protocol"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Get", from: "2.1.0")
    ],
    targets: [
        .target(name: "abstract-protocol-rename-with-protocol", dependencies: [
            .product(name: "Get", package: "Get")
        ], path: "Sources")
    ]
)