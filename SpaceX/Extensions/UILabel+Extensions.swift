//
//  UILabel+Extensions.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-04.
//


import UIKit

extension UILabel {
    func applyStyle(textColor: UIColor?, font: UIFont? = nil) {
        self.textColor = textColor
        self.font = font ?? self.font
    }
}
