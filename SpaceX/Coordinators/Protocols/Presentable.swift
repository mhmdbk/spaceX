//
//  Presentable.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController
}

extension Presentable where Self: UIViewController {
    func toPresent() -> UIViewController {
        return self
    }
}
