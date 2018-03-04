// swift-tools-version:4.1

import PackageDescription

let package = Package(
    name: "PythonTool",
    products: [
        .executable(name: "PythonTool", targets: ["PythonTool"]),
        .library(name: "PythonKit", targets: ["PythonKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/pvieito/CommandLineKit.git", .branch("master")),
        .package(url: "https://github.com/pvieito/LoggerKit", .branch("master"))
    ],
    targets: [
        .target(name: "PythonTool",
                dependencies: ["LoggerKit", "CommandLineKit", "PythonKit"],
                path: "PythonTool"),
        .target(name: "PythonKit", dependencies: ["Python"], path: "PythonKit"),
        .target(name: "Python", path: "Python")
    ]
)
