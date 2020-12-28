//
//  IngredientCell.swift
//  CookingRecipes
//
//  Created by Hiram Castro on 10/31/20.
//

import UIKit

class IngredientCell: UITableViewCell {
    
    @IBOutlet weak var Ingredient: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
