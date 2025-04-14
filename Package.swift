// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
	name: "AtomicSDK",
	platforms: [.iOS(.v13)],
	products: [
		// Products define the executables and libraries a package produces, and make them visible to other packages.
		.library(
			name: "AtomicTransact",
			targets: ["AtomicTransact", "QuantumIOS", "MuppetIOS", "QuantumSessionIOS"])
	],
	targets: [
		.binaryTarget(
			name: "AtomicTransact",
			path: "artifacts/AtomicTransact.xcframework"),
		.binaryTarget(
			name: "QuantumIOS",
			path: "artifacts/QuantumIOS.xcframework"),
        .binaryTarget(
            name: "MuppetIOS",
            path: "artifacts/MuppetIOS.xcframework"),
        .binaryTarget(
            name: "QuantumSessionIOS",
            path: "artifacts/QuantumSessionIOS.xcframework")
	]
)
