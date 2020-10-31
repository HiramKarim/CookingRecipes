//
//  RecipeDetailVC.swift
//  CookingRecipes
//
//  Created by Hiram Castro on 10/31/20.
//

import UIKit
import AVFoundation
import WebKit

class RecipeDetailVC: UIViewController {
    
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var MealName: UILabel!
    @IBOutlet weak var MealInstrucions: UILabel!
    @IBOutlet weak var IngredientsTableView: UITableView!
    @IBOutlet weak var webView: WKWebView!
    
    var mealID:String?
    
    private var mealDetailVM = MealDetailVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let lookupMealID = mealID else { return }
        
        lookupMeal(with: lookupMealID)
    }
    
    private func lookupMeal(with mealID:String) {
        mealDetailVM.lookupMeal(mealID) { [weak self] (result) in
            guard let self = self else { return }
            if result {
                DispatchQueue.main.async {
                    self.updateUI()
                }
            } else {
                self.showAlert()
            }
        }
    }
    
    private func updateUI() {
        guard let mealVM = mealDetailVM.getMealVM(at: 0) else { return }
        
        self.MealName.text = mealVM.strMeal ?? ""
        self.MealInstrucions.text = mealVM.strInstructions ?? ""
        
        guard let stringURL = mealVM.strYoutube, let url = URL(string: stringURL) else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "", message: mealDetailVM.errorMessage, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
