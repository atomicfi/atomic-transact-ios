# Atomic Transact iOS SDK

iOS SDK for Atomic Transact.

See our [documentation](https://docs.atomicfi.com/reference/transact-sdk#libraries__ios) for additional information.

## Using release binaries in your own Swift package

Releases published with ZIP support include a `.xcframework.zip` for each static and dynamic framework, plus `checksums.txt` containing the SHA-256 checksum of each ZIP. Existing `.tar.gz` assets remain available.

To use the binaries directly, download `checksums.txt` from the [release](https://github.com/atomicfi/atomic-transact-ios/releases) you want to use. Replace `<version>` and the checksum placeholders below with the release tag and the corresponding values from that file:

```swift
// swift-tools-version: 6.0
import PackageDescription

let version = "<version>"
let baseURL = "https://github.com/atomicfi/atomic-transact-ios/releases/download/\(version)"

let package = Package(
    name: "AtomicBinaries",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "AtomicTransact", targets: ["AtomicTransact", "Uplink", "MuppetIOS"])
    ],
    targets: [
        .binaryTarget(
            name: "AtomicTransact",
            url: "\(baseURL)/AtomicTransact.xcframework.zip",
            checksum: "<AtomicTransact ZIP checksum>"),
        .binaryTarget(
            name: "Uplink",
            url: "\(baseURL)/Uplink.xcframework.zip",
            checksum: "<Uplink ZIP checksum>"),
        .binaryTarget(
            name: "MuppetIOS",
            url: "\(baseURL)/MuppetIOS.xcframework.zip",
            checksum: "<MuppetIOS ZIP checksum>")
    ]
)
```

AtomicTransact requires all three frameworks from the same release. For dynamic linking, use the `-Dynamic` target names, ZIPs, and their corresponding checksums for all three frameworks.

You can verify a downloaded ZIP with `swift package compute-checksum AtomicTransact.xcframework.zip`. Use the published ZIP unchanged so its checksum matches. These URL-based targets download the release assets directly without checking out this repository.
