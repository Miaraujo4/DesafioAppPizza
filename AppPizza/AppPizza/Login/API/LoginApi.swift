//
//  LoginApi.swift
//  AppPizza
//
//  Created by Milena Pereira de Araujo on 07/06/21.
//

import Foundation

protocol LoginAPIProtocol {
    func acessLogin(login: LoginModel, callback: @escaping(Result<LoginResponse, HttpError>)-> Void)
}

class LoginAPI: LoginAPIProtocol {
    let urlLogin = "https://p3teufi0k9.execute-api.us-east-1.amazonaws.com/v1/signin"
    
    
    func acessLogin(login: LoginModel, callback: @escaping (Result<LoginResponse, HttpError>) -> Void) {
        if let url = URL(string: urlLogin) {
            let session = URLSession(configuration: .default)
            do {
                var request = URLRequest(url: url)
                _ = try JSONEncoder().encode(login)
                request.httpBody = try JSONEncoder().encode(login)
                request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
                request.httpMethod = "POST"
                let task = session.dataTask(with: request) { (data, response, error) in
                    if error != nil {
                        callback(.failure(.notData))
                        return
                    }
                    if let safeData = data {
                        if let login = self.parseJson(safeData) {
                            callback(.success(login))
                        } else {
                            callback(.failure(.notData))
                        }
                    } else {
                        callback(.failure(.notData))
                    }
                }
                task.resume()
            } catch {
                callback(.failure(.badRequest))
            }
        } else {
            callback(.failure(.notData))
        }
    }
    
    func parseJson(_ loginData: Data) -> LoginResponse? {
        let decoder = JSONDecoder()
        do {
            let loginResponse = try decoder.decode(LoginResponse.self, from: loginData)
            return loginResponse
        } catch {
            return nil
        }
    }
}

