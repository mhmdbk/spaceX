//
//  RouterType.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import UIKit

protocol RouterType: AnyObject, Presentable {
    var navigationController: UINavigationController { get }
    var rootViewController: UIViewController? { get }
    func present(_ module: Presentable, animated: Bool, presentationStyle: UIModalPresentationStyle)
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    func push(_ module: Presentable, animated: Bool, completion: (() -> Void)?)
    func popModule(animated: Bool)
    func setRootModule(_ module: Presentable, hideBar: Bool)
    func popToRootModule(animated: Bool)
    func popToViewController(viewController: UIViewController)
    func dismissToRootModule(animated: Bool)
}
