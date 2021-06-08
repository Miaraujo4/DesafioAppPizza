//
//  ChoiceViewModel.swift
//  AppPizza
//
//  Created by Milena Pereira de Araujo on 03/06/21.
//

import Foundation

class ChoiceViewModel {
    
    // MARK: - Private Properties
    private let api: PizzaManagerProtocol
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
    func getPizzas(callback: @escaping(_ wasComplete: Bool, _ error: ErrorModel?) -> Void) {
        api.getPizzas { result in
            switch result {
            case .success(let pizzas):
                self.listPizza = pizzas
                self.listPizzaHelper = pizzas
                callback(true, nil)
            case .failure(let htttpError):
                let title: String = "Erro"
                var description: String = ""
                switch htttpError {
                case .badRequest:
                    description = "Não foi possivel conectar ao servidor"
                case .notData:
                    description = "Não foi possivel acessar a informação"
                case .urlNotFound:
                    description = "Não encontrado"
                }
                let error = ErrorModel(title: title, description: description)
                callback(false, error)
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




