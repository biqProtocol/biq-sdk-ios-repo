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
            checksum: "125aef18fcbc702ce4d0caac7d10b156aaf00560bdf0f29812f7e87c6896470c"
        )
    ]
)

