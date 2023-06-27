import ProjectDescription

let name = "Owl"
let bundleId = "com.\(name)"
let sources: SourceFilesList = ["Sources/**"]

let mainTarget = Target(
    name: name,
    platform: .iOS,
    product: .framework,
    bundleId: bundleId,
    infoPlist: .default,
    sources: sources
)

let project = Project(
    name: name,
    targets: [mainTarget]
)

