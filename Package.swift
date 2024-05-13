// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "SingleHtmlWriter",
  products: [
    .library(
      name: "SingleHtmlWriter",
      targets: ["SingleHtmlWriter"])
  ],
  dependencies: [
    .package(url: "https://github.com/realm/SwiftLint.git", from: "0.55.0")
  ],
  targets: [
    .target(
      name: "SingleHtmlWriter"),
    .executableTarget(
      name: "SampleApp",
      dependencies: [
        "SingleHtmlWriter"
      ]
    ),
    .testTarget(
      name: "SingleHtmlWriterTests",
      dependencies: ["SingleHtmlWriter"]),
  ]
)
