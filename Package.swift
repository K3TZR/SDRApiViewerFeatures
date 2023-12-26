// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SDRApiFeatures",
  platforms: [.macOS(.v14),],
  
  products: [
    .library(name: "ObjectsView", targets: ["ObjectsView"]),
    .library(name: "MessagesView", targets: ["MessagesView"]),
  ],
  
  dependencies: [
    // ----- K3TZR -----
    .package(url: "https://github.com/K3TZR/ApiFeatures.git", branch: "main"),
  ],
  
  targets: [
    // --------------- Modules ---------------
    // MessagesView
    .target(name: "MessagesView", dependencies: [
      .product(name: "FlexApi", package: "ApiFeatures"),
    ]),
    
    // ObjectsView
    .target(name: "ObjectsView", dependencies: [
      .product(name: "FlexApi", package: "ApiFeatures"),
    ]),
    
    // ---------------- Tests ----------------
  ]
)
