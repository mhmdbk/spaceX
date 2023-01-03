//
//  RocketDetailsViewModel.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import Foundation

class RocketDetailsViewModel {

    typealias Dependencies = HasNetworkService

    private let dependencies: Dependencies

    let launch: Launch
    var rocket: Rocket!

    init(dependencies: Dependencies, launch: Launch) {
        self.dependencies = dependencies
        self.launch = launch
    }
}
