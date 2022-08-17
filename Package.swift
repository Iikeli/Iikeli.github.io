// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "iiroalhonen.com",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "iiroalhonen.com",
            targets: ["iiroalhonen.com"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.9.0")
    ],
    targets: [
        .executableTarget(
            name: "iiroalhonen.com",
            dependencies: ["Publish"]
        )
    ]
)
