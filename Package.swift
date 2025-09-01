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
            checksum: "347f9c17591d0df8b54027a3635270673cf40da0ae8fa0a126cd2f9c3dce9f42"
        )
    ]
)

