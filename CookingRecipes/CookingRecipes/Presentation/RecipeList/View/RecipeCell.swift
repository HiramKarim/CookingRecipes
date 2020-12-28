//
//  RecipeCell.swift
//  CookingRecipes
//
//  Created by Hiram Castro on 10/31/20.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var MealThumb: UIImageView!
    @IBOutlet weak var MealName: UILabel!
    @IBOutlet weak var MealCategory: UILabel!
    
    var mealVM:MealVM? {
        didSet {
            MealName.text = mealVM?.strMeal ?? ""
            MealCategory.text = mealVM?.strCategory ?? ""
            MealThumb.url(mealVM?.strMealThumb)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
