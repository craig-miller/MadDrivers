// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
let package = Package(
    name: "SPIReadMotion",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/madmachineio/SwiftIO.git", branch: "main"),
        .package(url: "https://github.com/madmachineio/MadBoards.git", branch: "main"),
        .package(url: "https://github.com/madmachineio/MadDrivers.git", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "SPIReadMotion",
            dependencies: [
                "SwiftIO",
                "MadBoards",
                // use specific library would speed up the compile procedure
                .product(name: "BMI160", package: "MadDrivers")
            ]),
        .testTarget(
            name: "SPIReadMotionTests",
            dependencies: ["SPIReadMotion"]),
    ]
)
