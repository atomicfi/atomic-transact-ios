// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
	name: "AtomicSDK",
	platforms: [.iOS(.v14)],
	products: [
		// Products define the executables and libraries a package produces, and make them visible to other packages.
		.library(
			name: "AtomicTransact",
			targets: ["AtomicTransact"]),
		.library(
			name: "AtomicTransactSwiftUI",
			targets: ["AtomicTransactSwiftUI", "AtomicTransact"])
	],
	dependencies: [
		// Dependencies declare other packages that this package depends on.
	],
	targets: [
		.binaryTarget(
			name: "AtomicTransact",
			path: "artifacts/AtomicTransact.xcframework"),
		.binaryTarget(
			name: "AtomicTransactSwiftUI",
			path: "artifacts/AtomicTransactSwiftUI.xcframework")
	]
)
