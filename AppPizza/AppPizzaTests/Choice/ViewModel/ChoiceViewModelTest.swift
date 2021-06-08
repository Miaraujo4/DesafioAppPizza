//
//  ChoiceViewModelTest.swift
//  AppPizzaTests
//
//  Created by Milena Pereira de Araujo on 07/06/21.
//

import XCTest

@testable import AppPizza

class ChoiceViewModelTest: XCTestCase {
    
    var viewModel: ChoiceViewModel!

    override func setUpWithError() throws {
        viewModel = ChoiceViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNamePizzaIsEmpty() {
        let pizza: String = ""
        viewModel.filterPizza(namePizza: pizza) {
            XCTAssertTrue(viewModel.listPizza.isEmpty)
        }
    }

}
