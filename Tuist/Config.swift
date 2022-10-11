//
//  Config.swift
//  ZipManifests
//
//  Created by Jeongho Moon on 2022/10/11.
//

import ProjectDescription

let config = Config(
    plugins: [
        .local(path: .relativeToManifest("../../Plugins/Zip")),
    ]
)
