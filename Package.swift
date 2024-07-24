// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
	name: "AtomicSDK",
	platforms: [.iOS(.v13)],
	products: [
		// Products define the executables and libraries a package produces, and make them visible to other packages.
		.library(
			name: "AtomicTransact",
			targets: ["AtomicTransact", "MuppetIOS"]),
		.library(
			name: "AtomicTransactSwiftUI",
			targets: ["AtomicTransactSwiftUI", "AtomicTransact", "MuppetIOS"])
	],
	targets: [
		.binaryTarget(
			name: "AtomicTransact",
			path: "artifacts/AtomicTransact.xcframework"),
		.binaryTarget(
			name: "AtomicTransactSwiftUI",
			path: "artifacts/AtomicTransactSwiftUI.xcframework"),
        .binaryTarget(
            name: "MuppetIOS",
            path: "artifacts/MuppetIOS.xcframework")
	]
)
