//
//  StoryboardLoadable.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import UIKit

protocol StoryboardLoadable {

    static var storyboardId: String { get }

    static var storyboardControllerId: String { get }
}

extension StoryboardLoadable where Self: UIViewController {
    static var storyboardId: String {
        return String(describing: Self.self)
    }

    static var storyboardControllerId: String {
        return String(describing: Self.self)
    }

    static func loadFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: Self.storyboardId, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: Self.storyboardControllerId) as! Self
    }
}
