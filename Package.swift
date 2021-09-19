// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
	name: "TransactiOSSDK",
	platforms: [.iOS(.v14)],
	products: [
		// Products define the executables and libraries a package produces, and make them visible to other packages.
		.library(
			name: "AtomicTransact",
			targets: ["AtomicTransactBinary"])
	],
	dependencies: [
		// Dependencies declare other packages that this package depends on.
	],
	targets: [
		.binaryTarget(
			name: "AtomicTransactBinary",
			path: "Sources/AtomicTransactBinary/AtomicTransact.xcframework")
	]
)
