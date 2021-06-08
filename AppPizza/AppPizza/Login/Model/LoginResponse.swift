//
//  LoginResponse.swift
//  AppPizza
//
//  Created by Milena Pereira de Araujo on 07/06/21.
//

import Foundation

struct LoginResponse: Decodable {
    var accessToken: String
    var tokenType: String
}
