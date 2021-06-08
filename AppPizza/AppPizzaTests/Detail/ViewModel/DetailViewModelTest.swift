//
//  DetailViewModelTest.swift
//  AppPizzaTests
//
//  Created by Milena Pereira de Araujo on 07/06/21.
//

import XCTest

@testable import AppPizza

class DetailViewModelTest: XCTestCase {
    
    var viewModel: DetailViewModel!
        
    override func setUpWithError() throws {
        viewModel = DetailViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWhenPizzaIsNil() {
        XCTAssertNil(viewModel.pizza)
    }
    
    func testWhenPizzaIsNotNil() {
        viewModel.pizza = PizzaInfo(id: "01", name: "pizza", imageUrl: "image", rating: 1, priceP: 1.0, priceM: 1.0, priceG: 1.0)
        XCTAssertNotNil(viewModel.pizza)
    }
    
    func testWhenPricePChoiced() {
        viewModel.pizza = PizzaInfo(id: "01", name: "pizza", imageUrl: "image", rating: 1, priceP: 20.0, priceM: 40.0, priceG: 70.0)
        let price = viewModel.priceChoice(buttonPressed: "P")
        XCTAssertEqual(price, "R$ 20,00")
    }
    
    func testWhenPriceMChoiced() {
        viewModel.pizza = PizzaInfo(id: "01", name: "pizza", imageUrl: "image", rating: 1, priceP: 20.0, priceM: 40.0, priceG: 70.0)
        let price = viewModel.priceChoice(buttonPressed: "M")
        XCTAssertEqual(price, "R$ 40,00")
    }
    
    func testWhenPriceGChoiced() {
        viewModel.pizza = PizzaInfo(id: "01", name: "pizza", imageUrl: "image", rating: 1, priceP: 20.0, priceM: 40.0, priceG: 70.0)
        let price = viewModel.priceChoice(buttonPressed: "G")
        XCTAssertEqual(price, "R$ 70,00")
    }
}
