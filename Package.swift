// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swiki",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "Swiki",
            targets: ["Swiki", "SwikiModels"]),
        .library(
            name: "SwikiModels",
            targets: ["SwikiModels"]
        ),
    ],
    targets: [
        .target(
            name: "Swiki",
            dependencies: [
                "SwikiModels"
            ]
        ),
        .target(
            name: "SwikiModels"
        ),
        .testTarget(
            name: "SwikiTests",
            dependencies: ["Swiki", "SwikiModels"]
        ),
    ]
)
