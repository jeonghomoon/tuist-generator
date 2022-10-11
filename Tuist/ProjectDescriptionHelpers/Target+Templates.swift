//
//  Target+Templates.swift
//  ApplicationManifests
//
//  Created by Jeongho Moon on 2022/10/11.
//

import ProjectDescription

extension Target {
    private static let organizationIdentifier: String = "com.jeonghomoon"
    
    public static func makeTargets(
        name: String,
        platform: Platform,
        deploymentTarget: DeploymentTarget,
        additionalTargets: [String]
    ) -> [Target] {
        let appTargets = Target.makeAppTargets(
            name: name,
            platform: platform,
            deploymentTarget: deploymentTarget,
            dependencies: additionalTargets.map {
                TargetDependency.target(name: $0)
            }
        )
        let frameworkTargets = additionalTargets.flatMap {
            Target.makeFrameworkTargets(
                name: $0,
                platform: platform,
                deploymentTarget: deploymentTarget
            )
        }

        return appTargets + frameworkTargets
    }

    private static func makeAppTargets(
        name: String,
        platform: Platform,
        deploymentTarget: DeploymentTarget,
        dependencies: [TargetDependency]
    ) -> [Target] {
        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: "\(organizationIdentifier).\(name)",
            deploymentTarget: deploymentTarget,
            infoPlist: .file(path: "Targets/\(name)/Supports/Info.plist"),
            sources: ["Targets/\(name)/Sources/**"],
            resources: ["Targets/\(name)/Resources/**"],
            dependencies: dependencies
        )
        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "\(organizationIdentifier).\(name)Tests",
            deploymentTarget: deploymentTarget,
            infoPlist: .default,
            sources: ["Targets/\(name)/Tests/**"],
            dependencies: [.target(name: "\(name)")]
        )

        return [mainTarget, testTarget]
    }

    private static func makeFrameworkTargets(
        name: String,
        platform: Platform,
        deploymentTarget: DeploymentTarget
    ) -> [Target] {
        let sources = Target(
            name: name,
            platform: platform,
            product: .framework,
            bundleId: "\(organizationIdentifier).\(name)",
            deploymentTarget: deploymentTarget,
            infoPlist: .default,
            sources: ["Targets/\(name)/Sources/**"],
            resources: [],
            dependencies: []
        )
        let tests = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "\(organizationIdentifier).\(name)Tests",
            deploymentTarget: deploymentTarget,
            infoPlist: .default,
            sources: ["Targets/\(name)/Tests/**"],
            resources: [],
            dependencies: [.target(name: name)]
        )

        return [sources, tests]
    }
}
