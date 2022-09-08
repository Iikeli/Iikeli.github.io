---
date: 2022-09-07 17:00
description: Use SPM plugins to build a Publish website.
tags: website, article, tutorial
---
#  Build Publish Sites With Xcode Plugins

On [the last article](https://www.iiroalhonen.com/posts/publish-tutorial/) I published, I explained how to build and release a website made with Publish using GitHub Actions. On this tutorial I will refactor some of that code, so the building is done on the developer machine as the project is build by using [Swift Package Plugins](https://developer.apple.com/videos/play/wwdc2022/110359/).

The simplest way to play around with plugins is with command plugins, so we will start there.

## Setup

First thing we need to change is the `swift-tools-version` used by the package. We need a minimum of 5.6 to use Swift Package Plugins. Where you specify it is the first line in `Package.swift`. `[1]`

Next we add our plugin and as a product. `[2]`

And as a target. `[3]`

This is how the `Package.swift` should look now:

```swift
// swift-tools-version:5.6 // [1]

import PackageDescription

let package = Package(
    name: "iiroalhonen",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "iiroalhonen",
            targets: ["iiroalhonen"]
        ),
        // [2]
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
        // [3]
        .plugin(
            name: "Builder",
            capability: .command(
                intent: .custom(
                    verb: "build",
                    description: "Builds the output files for the Publish website."
                ),
                permissions: [.writeToPackageDirectory(reason: "This plugin needs to create & replace files in the Output folder.")]
            )
        )
    ]
)
```

NOTE: DOES NOT WORK BECAUSE THE PLUGIN IS SANDBOXED AND WON'T WORK WITH PUBLISH.
