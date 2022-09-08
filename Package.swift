// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "iiroalhonen",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "iiroalhonen",
            targets: ["iiroalhonen"]
        ),
        .plugin(name: "Builder", targets: ["Builder"])
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.9.0")
    ],
    targets: [
        .executableTarget(
            name: "iiroalhonen",
            dependencies: [.product(name: "Publish", package: "Publish")]
        ),
        .plugin(
            name: "Builder",
            capability: .command(
                intent: .custom(
                    verb: "build",
                    description: "Builds the output files for the Publish website."
                ),
                permissions: [.writeToPackageDirectory(reason: "This plugin needs to create & replace files in the Output folder.")]
            ),
            dependencies: [.product(name: "Publish", package: "Publish")]
        )
    ]
)
