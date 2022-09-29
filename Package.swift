// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppleStoreView",
    platforms: [
        .macOS(.v10_14), .iOS(.v15), .tvOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AppleStoreView",
            targets: ["AppleStoreView"]),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher", branch: "master"),
        .package(url: "https://github.com/JWAutumn/ACarousel", from: "0.2.0"),
        .package(url: "https://github.com/Flight-School/AnyCodable", branch: "master"),
        .package(url: "https://github.com/danielsaidi/WebViewKit", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AppleStoreView",
            dependencies: [
                .product(name: "Kingfisher", package: "Kingfisher"),
                .product(name: "ACarousel", package: "ACarousel"),
                .product(name: "AnyCodable", package: "AnyCodable"),
                .product(name: "WebViewKit", package: "WebViewKit")
            ]),
        .testTarget(
            name: "AppleStoreViewTests",
            dependencies: ["AppleStoreView"]),
    ]
)
