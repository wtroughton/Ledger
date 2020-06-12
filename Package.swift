// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "Ledger",
  products: [
    .library(
      name: "Ledger",
      targets: ["Ledger"]
    )
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Ledger",
      dependencies: [],
      path: "Sources"
    ),
    .testTarget(
      name: "LedgerTests",
      dependencies: ["Ledger"]
    ),
    .testTarget(
      name: "BTreeTests",
      dependencies: ["Ledger"]
    )
  ]
)
