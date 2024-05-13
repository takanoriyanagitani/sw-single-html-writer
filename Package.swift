// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "SingleHtmlWriter",
  products: [
    .library(
      name: "SingleHtmlWriter",
      targets: ["SingleHtmlWriter"])
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
