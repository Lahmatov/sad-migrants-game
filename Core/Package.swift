// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MigrantCore",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(name: "MigrantCore", targets: ["MigrantCore"])
    ],
    targets: [
        // Сценарий лежит рядом с движком: тесты ядра проверяют настоящие
        // карточки, а приложение читает их из того же бандла.
        .target(name: "MigrantCore", resources: [.copy("Content")]),
        .testTarget(name: "MigrantCoreTests", dependencies: ["MigrantCore"])
    ]
)
