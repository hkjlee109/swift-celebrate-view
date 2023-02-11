// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "swift-celebrate-view",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "UICelebrateView",
            targets: ["UICelebrateView"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "UICelebrateView",
            dependencies: [],
            resources: [.process("Resources/")]
        )
    ]
)
