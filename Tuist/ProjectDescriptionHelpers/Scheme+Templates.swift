//
//  Scheme+Templates.swift
//  ApplicationManifests
//
//  Created by Jeongho Moon on 2022/10/11.
//

import ProjectDescription

extension Scheme {
    public static func makeScheme(
        name: String,
        target: ConfigurationName
    ) -> Scheme {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(
                    coverage: true,
                    codeCoverageTargets: ["\(name)"]
                )
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
}
