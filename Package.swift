// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
	name: "AtomicSDK",
	platforms: [.iOS(.v15)],
	products: [
		// Products define the executables and libraries a package produces, and make them visible to other packages.
		.library(
			name: "AtomicTransact",
			targets: ["AtomicTransact", "QuantumIOS", "MuppetIOS"]),
		.library(
			name: "AtomicTransact-Dynamic",
			targets: ["AtomicTransact-Dynamic", "QuantumIOS-Dynamic", "MuppetIOS-Dynamic"])
	],
	targets: [
		.binaryTarget(
			name: "AtomicTransact",
			path: "artifacts/AtomicTransact.xcframework"),
		.binaryTarget(
			name: "AtomicTransact-Dynamic",
			path: "artifacts/AtomicTransact-Dynamic.xcframework"),
		.binaryTarget(
			name: "QuantumIOS",
			path: "artifacts/QuantumIOS.xcframework"),
		.binaryTarget(
			name: "QuantumIOS-Dynamic",
			path: "artifacts/QuantumIOS-Dynamic.xcframework"),
		.binaryTarget(
            name: "MuppetIOS",
            path: "artifacts/MuppetIOS.xcframework"),
		.binaryTarget(
            name: "MuppetIOS-Dynamic",
            path: "artifacts/MuppetIOS-Dynamic.xcframework")
	]
)
