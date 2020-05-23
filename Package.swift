// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "QuickComponents",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "QuickComponents",
            targets: ["QuickComponents"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "QuickComponents",
            dependencies: []),
        .testTarget(
            name: "QuickComponentsTests",
            dependencies: ["QuickComponents"]),
    ]
)
