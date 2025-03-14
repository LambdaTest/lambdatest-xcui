// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "Smartui XCUI Swift",
    products: [
        .library(
            name: "SmartuiXcui",
            targets: ["SmartuiXcui"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SmartuiXcui",
            dependencies: []
        ),
        .testTarget(
            name: "smartui-xcuiTests",
            dependencies: ["SmartuiXcui"]),
    ]
)
