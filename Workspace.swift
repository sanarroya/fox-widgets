import Foundation
import ProjectDescription

let workspace = Workspace(
    name: "Fox",
    projects: [
        Path.relativeToCurrentFile("."),
        "Frameworks/**",
    ]
)
