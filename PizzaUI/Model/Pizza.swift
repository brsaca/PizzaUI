//
//  Pizza.swift
//  PizzaUI
//
//  Created by Brenda Saavedra Cantu on 19/10/23.
//

import Foundation

struct Pizza: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let imageCompleted: String
    let details: String
    let priceLarge: Double
    let priceMedium: Double
    let priceSmall: Double
}

extension Pizza {
    static let MOCK_PIZZAS = [
        Pizza(name: "Pepperoni Blast", image: "pepperoni", imageCompleted: "pepperoniComplete", details:
                "The combination of perfectly melted mozzarella cheese, tangy tomato sauce, and a crispy yet chewy crust creates a harmonious balance that leaves you wanting more. ", priceLarge: 25.99, priceMedium: 17.99, priceSmall: 15.99),
        Pizza(name: "Shrimptastic", image: "shrimptastic", imageCompleted: "shrimptasticComplete", details:
                "This pizza showcases the perfect combination of shrimp and cheese, with gooey melted cheeses complementing the savory shrimp toppings for a truly indulgent experience.", priceLarge: 25.99, priceMedium: 17.99, priceSmall: 15.99),
        Pizza(name: "Midnight Harvest", image: "midnight", imageCompleted: "midnightComplete", details:
                "This pizza celebrates the rich and bold flavors of black olives paired with a medley of cheeses. The deep, earthy taste of black olives harmonizes beautifully with the creamy, melted cheeses. ", priceLarge: 25.99, priceMedium: 17.99, priceSmall: 15.99)
    ]
}
