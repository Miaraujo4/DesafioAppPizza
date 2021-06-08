//
//  PizzaModel.swift
//  AppPizza
//
//  Created by Milena Pereira de Araujo on 03/06/21.
//

import Foundation

struct PizzaInfo: Codable {
    var id: String
    var name: String
    var imageUrl: String 
    var rating: Int
    var priceP: Double
    var priceM: Double
    var priceG: Double
    
}

