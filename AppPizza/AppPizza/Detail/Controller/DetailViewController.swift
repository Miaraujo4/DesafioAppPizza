//
//  DetailViewController.swift
//  AppPizza
//
//  Created by Milena Pereira de Araujo on 04/06/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var pizzaDetailImage: UIImageView!
    @IBOutlet weak var titleDetailLabel: UILabel!
    @IBOutlet weak var pricePizzaLabel: UILabel!
    @IBOutlet weak var star1Detail: UIImageView!
    @IBOutlet weak var star2Detail: UIImageView!
    @IBOutlet weak var star3Detail: UIImageView!
    @IBOutlet weak var star4Detail: UIImageView!
    @IBOutlet weak var star5Detail: UIImageView!
    @IBOutlet weak var sizeP: UIButton!
    @IBOutlet weak var sizeM: UIButton!
    @IBOutlet weak var sizeG: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    
    // MARK: - Properties
    var viewModelDetail: DetailViewModel = DetailViewModel()
    private let identifierSegue: String = "sucessSegue"
    
    // MARK: - Func
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        formatingViewDetail()
        pricePizzaLabel.text = "R$ " + String(format: "%.2f", viewModelDetail.pizza!.priceP).replacingOccurrences(of: ".", with: ",")
        sizeP.layer.cornerRadius = 10
        sizeM.layer.cornerRadius = 10
        sizeG.layer.cornerRadius = 10
        sizeP.backgroundColor = UIColor(red: 0.478, green: 0.776, blue: 0.31, alpha: 1)
        sizeP.setTitleColor(UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1), for: .normal)
        
    }
    
    func formatingViewDetail() {
        titleDetailLabel.text = "Pizza de \(viewModelDetail.pizza?.name ?? "")"
        pizzaDetailImage.load(urlString: viewModelDetail.pizza!.imageUrl)
        
        let imageStars = [star1Detail, star2Detail, star3Detail, star4Detail, star5Detail]
        imageStars.forEach { img in
            img?.image = #imageLiteral(resourceName: "starGrey")
        }
        let rating: Int = viewModelDetail.pizza!.rating
        
        for position in 0...rating - 1 {
            imageStars[position]?.image = #imageLiteral(resourceName: "starYellow")
        }
    }
    
    func clear() {
        let backgroundButtonColor: UIColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        let titleButtonColor: UIColor = UIColor(red: 0.157, green: 0.173, blue: 0.188, alpha: 1)
        sizeP.backgroundColor = backgroundButtonColor
        sizeM.backgroundColor = backgroundButtonColor
        sizeG.backgroundColor = backgroundButtonColor
        sizeP.setTitleColor(titleButtonColor, for: .normal)
        sizeM.setTitleColor(titleButtonColor, for: .normal)
        sizeG.setTitleColor(titleButtonColor, for: .normal)
    }
    
    
    // MARK: - IBAction
    @IBAction func buttonSizePressed(_ sender: UIButton) {
        clear()
        
        let buttonPressed = sender.currentTitle!
        sender.backgroundColor = UIColor(red: 0.478, green: 0.776, blue: 0.31, alpha: 1)
        sender.setTitleColor(UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1), for: .normal)
        pricePizzaLabel.text = viewModelDetail.priceChoice(buttonPressed: buttonPressed)
    }
    
    @IBAction func buttonBuyPressed(_ sender: UIButton) {
        performSegue(withIdentifier: identifierSegue, sender: nil)

    }


}
