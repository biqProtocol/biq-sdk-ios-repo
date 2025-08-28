// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "biqSdk",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "biqSdk",
            targets: ["biqSdk"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "biqSdk",
            url: "https://biqprotocol.github.io/biq-sdk-ios-repo/biqSdk.xcframework.zip",
            checksum: "2181cdbcba466ec46ea5677155cf5b64136dbfd6f8c042a58f10c253bda2a295"
        )
    ]
)

