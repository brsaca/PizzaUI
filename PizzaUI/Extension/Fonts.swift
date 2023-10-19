//
//  Fonts.swift
//  PizzaUI
//
//  Created by Brenda Saavedra Cantu on 19/10/23.
//

import SwiftUI

extension Font {
    enum Figtree {
        case black
        case bold
        case extrabold
        case light
        case medium
        case regular
        case semibold
        
        var value: String {
            switch self {
            case .black: return "Figtree-Black"
            case .bold: return "Figtree-Bold"
            case .extrabold:  return "Figtree-ExtraBold"
            case .light: return "Figtree-Light"
            case .medium: return "Figtree-Medium"
            case .regular: return "Figtree-Regular"
            case .semibold: return "Figtree-SemiBold"
            }
        }
    }

    /**
     Returns a custom Figtree font with the specified type and size.

     - Parameters:
       - type: The FigtreeFont type (e.g., .bold, .medium, .regular).
       - size: The size of the font (default is 24 points).

     - Returns: A custom `Font` with the specified Poppins type and size.
     */
    static func figtree(_ type: Figtree, size: CGFloat = 24) -> Font {
        return .custom(type.value, size: size)
    }
}
