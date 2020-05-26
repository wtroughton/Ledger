// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Ledger",
    products: [
        .library(
            name: "Ledger",
            targets: ["Ledger"]),
    ],
    targets: [
        .target(
            name: "Ledger",
            dependencies: []),
        .testTarget(
            name: "LedgerTests",
            dependencies: ["Ledger"]),
    ]
)
