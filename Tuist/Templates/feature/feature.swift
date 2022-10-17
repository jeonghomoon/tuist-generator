import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

let projectPath = "Projects/Features/\(nameAttribute)"
let appPath = projectPath + "/Targets/\(nameAttribute)"
let uiFrameworkPath = appPath + "UI"
let domainFrameworkPath = appPath + "Domain"
let dataFrameworkPath = appPath + "Data"

let template = Template(
    description: "Feature template",
    attributes: [
        nameAttribute
    ],
    items: [
        .file(
            path: projectPath + "/Project.swift",
            templatePath: "Project.stencil"
        ),
        .file(
            path: appPath + "/Resources/Assets.xcassets/AccentColor.colorset/Contents.json",
            templatePath: "Resources/AccentColor.stencil"
        ),
        .file(
            path: appPath + "/Resources/Assets.xcassets/AppIcon.appiconset/Contents.json",
            templatePath: "Resources/AppIcon.stencil"
        ),
        .file(
            path: appPath + "/Resources/Assets.xcassets/Contents.json",
            templatePath: "Resources/Assets.stencil"
        ),
        .file(
            path: appPath + "/Resources/LaunchScreen.storyboard",
            templatePath: "Resources/LaunchScreen.stencil"
        ),
        .file(
            path: appPath + "/Sources/AppDelegate.swift",
            templatePath: "Sources/AppDelegate.stencil"
        ),
        .file(
            path: appPath + "/Sources/SceneDelegate.swift",
            templatePath: "Sources/SceneDelegate.stencil"
        ),
        .file(
            path: appPath + "/Supports/Info.plist",
            templatePath: "Supports/Info.stencil"
        ),
        .file(
            path: appPath + "/Tests/\(nameAttribute)Tests.swift",
            templatePath: "Tests/Tests.stencil"
        ),
        .file(
            path: uiFrameworkPath + "/Resources/Colors.xcassets/Contents.json",
            templatePath: "Resources/Assets.stencil"
        ),
        .file(
            path: uiFrameworkPath + "/Resources/Images.xcassets/Contents.json",
            templatePath: "Resources/Assets.stencil"
        ),
        .file(
            path: uiFrameworkPath + "/Sources/\(nameAttribute)ViewController.swift",
            templatePath: "Sources/ViewController.stencil"
        ),
        .file(
            path: uiFrameworkPath + "/Tests/\(nameAttribute)UITests.swift",
            templatePath: "Tests/UITests.stencil"
        ),
        .file(
            path: domainFrameworkPath + "/Sources/\(nameAttribute)Domain.swift",
            templatePath: "Sources/Domain.stencil"
        ),
        .file(
            path: domainFrameworkPath + "/Tests/\(nameAttribute)DomainTests.swift",
            templatePath: "Tests/DomainTests.stencil"
        ),
        .file(
            path: dataFrameworkPath + "/Sources/\(nameAttribute)Data.swift",
            templatePath: "Sources/Data.stencil"
        ),
        .file(
            path: dataFrameworkPath + "/Tests/\(nameAttribute)Data.swift",
            templatePath: "Tests/DataTests.stencil"
        )
    ]
)
