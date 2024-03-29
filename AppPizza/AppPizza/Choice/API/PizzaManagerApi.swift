//
//  PizzaManager.swift
//  AppPizza
//
//  Created by Milena Pereira de Araujo on 03/06/21.
//

import Foundation


protocol PizzaManagerProtocol {
    func getPizzas(callBack: @escaping(Result<[PizzaInfo], HttpError>) -> Void)
}

class PizzaManagerApi: PizzaManagerProtocol {
    
    let pizzaURL = "https://p3teufi0k9.execute-api.us-east-1.amazonaws.com/v1/pizza"
    
    func getPizzas(callBack: @escaping (Result<[PizzaInfo], HttpError>) -> Void) {
       
        if let url = URL(string: pizzaURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    callBack(.failure(.notData))
                    return
                }
                if let safeData = data {
                    if let pizza = self.parseJson(safeData) {
                        callBack(.success(pizza))
                    } else {
                        callBack(.failure(.notData))
                    }
                } else {
                    callBack(.failure(.notData))
                }
            }
            task.resume()
        } else {
            callBack(.failure(.urlNotFound))
        }
    }
    
    func parseJson(_ pizzaData: Data) -> [PizzaInfo]? {
        let decoder = JSONDecoder()
        do {
            let pizza = try decoder.decode([PizzaInfo].self, from: pizzaData)
            return pizza
        } catch {
            return nil
        }
    }
    
    
}
