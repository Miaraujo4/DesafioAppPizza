//
//  ChoiceViewModel.swift
//  AppPizza
//
//  Created by Milena Pereira de Araujo on 03/06/21.
//

import UIKit

class ChoiceViewModel {
    
    // MARK: - Private Properties
    private let api: PizzaManagerApi
    private var listPizzaHelper: [PizzaInfo]
    
    // MARK: - Properties
    var listPizza: [PizzaInfo]
    
    
    // MARK: - Init
    init() {
        self.api = PizzaManagerApi()
        self.listPizza = [PizzaInfo]()
        self.listPizzaHelper = [PizzaInfo]()
    }
    
    // MARK: - Function
    func getPizzas(callback: @escaping(_ wasSafe: Bool) -> Void) {
        api.getPizzas { result in
            switch result {
            case .success(let pizzas):
                self.listPizza = pizzas
                self.listPizzaHelper = pizzas
                callback(true)
            case .failure(let error):
                callback(false)
            }
        }
    }
    
    func filterPizza(namePizza: String?, callback: () -> Void) {
        if let name = namePizza, !name.isEmpty {
            listPizza.removeAll()
            listPizzaHelper.forEach { (pizza) in
                if pizza.name.lowercased().contains(name) {
                    listPizza.append(pizza)
                }
            }
        } else {
            listPizza = listPizzaHelper
        }
        callback()
    }
    
}




