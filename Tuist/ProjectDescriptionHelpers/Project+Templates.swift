//
//  Project+Templates.swift
//  ZipManifests
//
//  Created by Jeongho Moon on 2022/10/10.
//

import ProjectDescription

extension Project {
    private static let organizationName: String = "jeonghomoon"

    public static func makeProject(
        name: String,
        platform: Platform,
        additionalTargets: [String]
    ) -> Project {
        let settings: Settings = .settings(
            base: [:],
            configurations: [
                .debug(name: .debug),
                .release(name: .release),
            ],
            defaultSettings: .recommended
        )

        let targets = Target.makeTargets(
            name: name,
            platform: platform,
            additionalTargets: additionalTargets
        )

        let schemes = [Scheme.makeScheme(name: name, target: .debug)]

        return Project(
            name: name,
            organizationName: organizationName,
            settings: settings,
            targets: targets,
            schemes: schemes
        )
    }
}
