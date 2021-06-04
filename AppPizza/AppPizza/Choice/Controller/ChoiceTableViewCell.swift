//
//  ChoiceTableViewCell.swift
//  AppPizza
//
//  Created by Milena Pereira de Araujo on 03/06/21.
//

import UIKit

class ChoiceTableViewCell: UITableViewCell {

    @IBOutlet weak var imageChoice: UIImageView!
    @IBOutlet weak var labelChoice: UILabel!
    
    //MARK: - Static Identifier
    static let cellIdentifier: String = "choiceCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
