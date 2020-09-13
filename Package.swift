// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIRedux",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "SwiftUIRedux",
            targets: ["SwiftUIRedux"]),
    ],
    targets: [
        .target(
            name: "SwiftUIRedux",
            dependencies: []),
        .testTarget(
            name: "SwiftUIReduxTests",
            dependencies: ["SwiftUIRedux"]),
    ]
)
