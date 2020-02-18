// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "ContainerCell",
    platforms: [.iOS(.v11)],
    products: [
        .library(name: "ContainerCell", targets: ["ContainerCell"])
    ],
    targets: [
        .target(name: "ContainerCell")
    ]
)
