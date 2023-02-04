// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "swift-celebrator",
    products: [
        .library(
            name: "UICelebrator",
            targets: ["UICelebrator"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "UICelebrator",
            dependencies: [])
    ]
)
