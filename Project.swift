import ProjectDescription

let name = "Fox"
let extensionName = "\(name)Extension"
let bundleId = "io.tuist.\(name)"
let extensionBundleId = "\(bundleId).extension"

let owlDependecy: TargetDependency = .project(target: "Owl", path: Path(Path.relativeToCurrentFile(".").pathString.appending("/Frameworks/Owl")))

let mainTarget = Target(
    name: name,
    platform: .iOS,
    product: .app,
    bundleId: bundleId,
    sources: ["Fox/Sources/**"],
    dependencies: [
        owlDependecy,
        .target(name: extensionName)
    ]
)

let widgetsTarget = Target(
    name: extensionName,
    platform: .iOS,
    product: .appExtension,
    bundleId: extensionBundleId,
    infoPlist:  .extendingDefault(with: [
        "NSExtension": [
            "NSExtensionPointIdentifier": "com.apple.widgetkit-extension",
        ]
    ]),
    sources: ["FoxExtension/Sources/**"],
    dependencies: [owlDependecy]
)

let project = Project(
    name: name,
    targets: [mainTarget, widgetsTarget]
)
