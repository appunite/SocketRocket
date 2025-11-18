// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SocketRocket",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13),
        .tvOS(.v11),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "SocketRocket",
            targets: ["SocketRocket"]
        )
    ],
    targets: [
        .target(
            name: "SocketRocket",
            path: "SocketRocket",
            exclude: ["Resources"],
            cSettings: [
                .headerSearchPath("include/SocketRocket"),
                .headerSearchPath("Internal"),
                .headerSearchPath("Internal/Delegate"),
                .headerSearchPath("Internal/Proxy"),
                .headerSearchPath("Internal/RunLoop"),
                .headerSearchPath("Internal/Security"),
                .headerSearchPath("Internal/Utilities"),
                .headerSearchPath("Internal/IOConsumer")
            ],
            linkerSettings: [
                .linkedLibrary("icucore"),
                .linkedFramework("CFNetwork", .when(platforms: [.iOS, .tvOS, .visionOS])),
                .linkedFramework("Security"),
                .linkedFramework("CoreServices", .when(platforms: [.macOS]))
            ]
        )
    ]
)
