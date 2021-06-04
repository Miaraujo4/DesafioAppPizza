//
//  PizzaTableViewCell.swift
//  AppPizza
//
//  Created by Milena Pereira de Araujo on 03/06/21.
//

import UIKit

class PizzaTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var imagePizzas: UIImageView!
    @IBOutlet weak var pizzaNameLabel: UILabel!
    @IBOutlet weak var cellPizzaView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var star5Image: UIImageView!
    @IBOutlet weak var star4Image: UIImageView!
    @IBOutlet weak var star3Image: UIImageView!
    @IBOutlet weak var star2Image: UIImageView!
    @IBOutlet weak var star1Image: UIImageView!
    

    
    // MARK: - Properties
    static let cellIdentifier: String = "pizzaCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
