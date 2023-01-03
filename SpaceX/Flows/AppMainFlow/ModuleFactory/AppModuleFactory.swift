//
//  AppModuleFactory.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import Foundation

final class AppModuleFactory: AppModuleFactoryType {

    func makeLaunchListModule(dependencies: LaunchListViewModel.Dependencies) -> LaunchListViewController {
        let launchListViewController = LaunchListViewController.loadFromStoryboard()
        launchListViewController.viewModel = LaunchListViewModel(dependencies: dependencies)
        return launchListViewController
    }

    func makeRocketDetailstModule(dependencies: RocketDetailsViewModel.Dependencies, launch: Launch) -> RocketDetailsViewController {
        let rocketDetailsViewController = RocketDetailsViewController.loadFromStoryboard()
        rocketDetailsViewController.viewModel = RocketDetailsViewModel(dependencies: dependencies, launch: launch)
        return rocketDetailsViewController
    }
}
