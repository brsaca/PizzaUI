//
//  Double.swift
//  PizzaUI
//
//  Created by Brenda Saavedra Cantu on 23/10/23.
//

import Foundation

extension Double {
    /**
     Formats a numeric value as a currency string.

     - Parameters:
       - minFractionDigits: The minimum number of fraction digits to display (default is 2).
       - maxFractionDigits: The maximum number of fraction digits to display (default is 2).

     - Returns: A formatted currency string representation of the numeric value.
     */
    func formatWithCurrency(minFractionDigits: Int = 2, maxFractionDigits: Int = 2) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = minFractionDigits
        formatter.maximumFractionDigits = maxFractionDigits
        
        if let formattedString = formatter.string(from: NSNumber(value: self)) {
            return "$\(formattedString)"
        } else {
            return String(self)
        }
    }
}
