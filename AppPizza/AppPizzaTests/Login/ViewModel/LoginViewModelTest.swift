//
//  LoginViewModelTest.swift
//  AppPizzaTests
//
//  Created by Milena Pereira de Araujo on 07/06/21.
//

import XCTest

@testable import AppPizza

class LoginViewModelTest: XCTestCase {

    var viewModel: LoginViewModel!
    
    override func setUpWithError() throws {
        viewModel = LoginViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenValidEmail() {
        let email: String = "milena@gmail.com"
        XCTAssertTrue(viewModel.isValidEmail(email))
    }
    
    func testWhenNotValidEmail() {
        let email: String = "milena"
        XCTAssertFalse(viewModel.isValidEmail(email))
    }
    
    func testWhenEmptyPassword() {
        let password: String = ""
        viewModel.getAcess(email: "", password: password) { wasSuccess, error in
            XCTAssertFalse(wasSuccess)
        }
    }
}
