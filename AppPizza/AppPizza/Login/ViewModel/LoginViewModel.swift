//
//  LoginViewModel.swift
//  AppPizza
//
//  Created by Milena Pereira de Araujo on 07/06/21.
//

import Foundation

class LoginViewModel {
    private let api: LoginAPIProtocol
    let loginResponde: LoginResponse
    var loginModel: LoginModel
    
    init() {
        self.api = LoginAPI()
        self.loginResponde = LoginResponse(accessToken: "", tokenType: "")
        self.loginModel = LoginModel(email: "", password: "")
    }
    
    func getAcess(email: String, password: String, callback: @escaping(_ wasComplete: Bool, _ error: ErrorModel?) -> Void) {
        if !email.isEmpty && !password.isEmpty && isValidEmail(email) {
            loginModel = LoginModel(email: email, password: password)
            api.acessLogin(login: loginModel) { result in
                switch result {
                case .success(_):
                    callback(true, nil)
                case .failure(_):
                    let error = ErrorModel(title: "Dados Inválidos", description: "O Usuário ou a senha são inválidos")
                    callback(false, error)
                }
            }
        } else {
            let error = ErrorModel(title: "Dados Inválidos", description: "O Usuário ou a senha são inválidos")
            callback(false, error)
        }
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}
