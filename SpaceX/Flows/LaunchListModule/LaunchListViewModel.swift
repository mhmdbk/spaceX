//
//  LaunchListViewModel.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import Foundation

class LaunchListViewModel {

    typealias Dependencies = HasNetworkService

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}
