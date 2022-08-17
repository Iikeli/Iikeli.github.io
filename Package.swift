// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "iiroalhonen",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "iiroalhonen",
            targets: ["iiroalhonen"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.9.0")
    ],
    targets: [
        .executableTarget(
            name: "iiroalhonen",
            dependencies: ["Publish"]
        )
    ]
)
