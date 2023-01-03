//
//  UIViewController+Extensions.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import UIKit

// MARK: - HUD Handling Methods
extension UIViewController {
    func showHUD() {
        let keyWindow = UIApplication.shared.windows.first { $0.isKeyWindow }
        guard let currentWindow = keyWindow else { return }

        let hasLoaderHUD = currentWindow.subviews.contains { ($0 as? LoaderHUD)?.presentingViewController == self }
        guard !hasLoaderHUD else { return }

        let loaderHUD = LoaderHUD(frame: UIScreen.main.bounds, viewController: self)
        currentWindow.addSubview(loaderHUD)
    }

    func hideHUD() {
        let keyWindow = UIApplication.shared.windows.first { $0.isKeyWindow }
        guard let currentWindow = keyWindow else { return }
        let loaderHUD = currentWindow.subviews.filter { view in
            guard let loader = view as? LoaderHUD else { return false }

            return loader.presentingViewController == self || loader.presentingViewController == nil
        }
        loaderHUD.forEach { $0.removeFromSuperview() }
    }
}
