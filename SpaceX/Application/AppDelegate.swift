//
//  AppDelegate.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?

    private lazy var appCoordinator: Coordinator = {
        let appNavigationController: UINavigationController = UINavigationController()
        let router = Router(navigationController: appNavigationController)
        return AppCoordinator(router: router)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // MARK: Window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = appCoordinator.toPresent()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()

        appCoordinator.start()

        return true 
    }
}

