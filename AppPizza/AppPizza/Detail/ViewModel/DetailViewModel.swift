//
//  DetailViewModel.swift
//  AppPizza
//
//  Created by Milena Pereira de Araujo on 04/06/21.
//

import UIKit

class DetailViewModel {
    
    var pizza: PizzaInfo?
    
    
    func priceChoice(buttonPressed: String) -> String {
        var price: Double = 0.00
        
        if buttonPressed == "P" {
            price = pizza!.priceP
        } else if buttonPressed == "M" {
            price = pizza!.priceM
        } else {
            price = pizza!.priceG
        }
        
       return "R$ " + String(format: "%.2f", price).replacingOccurrences(of: ".", with: ",")
    }
}
