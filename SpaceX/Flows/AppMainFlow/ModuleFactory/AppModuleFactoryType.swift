//
//  AppModuleFactoryType.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import Foundation

protocol AppModuleFactoryType: AnyObject {
    func makeLaunchListModule(dependencies: LaunchListViewModel.Dependencies) -> LaunchListViewController
    func makeRocketDetailstModule(dependencies: RocketDetailsViewModel.Dependencies, launch: Launch) -> RocketDetailsViewController
}
