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
            checksum: "1601c789c91a9a2959cf34fc07c1e5806d443d9bc194333f7948852a176873e2"
        )
    ]
)

