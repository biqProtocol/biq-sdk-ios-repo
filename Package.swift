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
            checksum: "f5708c482892442cf017a32f414193cff3be04609366f883c9fb5bf6c3764715"
        )
    ]
)

