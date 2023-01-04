//
//  Fonts.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-04.
//

import UIKit

struct Fonts {
    enum FontName {
        case font100 // ThinItalic
        case font200 // Thin
        case font300 // Regular
        case font400 // Light Italic
        case font500 // Light
        case font600 // Italic
        case font700 // Bold Italic
        case font800 // Bold
        case font900 // BlackItalic
        case font1000 // Black
    }

    private static let defaultLatinFontName = "MuseoSans-500"

    static let latinFonts: [FontName: String] = [
        .font100: "Lato-ThinItalic",
        .font200: "Lato-Thin",
        .font300: "Lato-Regular",
        .font400: "Lato-LightItalic",
        .font500: "Lato-Light",
        .font600: "Lato-Italic",
        .font700: "Lato-BoldItalic",
        .font800: "Lato-Bold",
        .font900: "Lato-BlackItalic",
        .font1000: "Lato-Black"
        
    ]

    static func fontName(font: FontName) -> String {
        return latinFonts[font] ?? defaultLatinFontName
    }

    static func font(name: FontName, size: CGFloat) -> UIFont {
        return Fonts.latinFont(for: name, size: size)
    }
}

// MARK: - Private helper methods
private extension Fonts {
    static func latinFont(for font: FontName, size: CGFloat) -> UIFont {
        let fontName = latinFonts[font]
        return Fonts.font(stringName: fontName, size: size)
    }

    static func font(stringName: String?, size: CGFloat) -> UIFont {
        guard let name = stringName, let font = UIFont(name: name, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
}
