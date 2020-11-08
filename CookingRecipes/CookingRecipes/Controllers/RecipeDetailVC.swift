//
//  RecipeDetailVC.swift
//  CookingRecipes
//
//  Created by Hiram Castro on 10/31/20.
//

import UIKit
import youtube_ios_player_helper

class RecipeDetailVC: UIViewController {
    
    @IBOutlet weak var videoView: YTPlayerView!
    @IBOutlet weak var MealName: UILabel!
    @IBOutlet weak var MealInstrucions: UILabel!
    @IBOutlet weak var IngredientsTableView: UITableView!
    @IBOutlet weak var webView: WKWebView!
    
    var mealID:String?
    
    private var mealDetailVM = MealListVM()

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
        
        guard let stringURL = mealVM.strYoutube
        else { return }
        
        let videoElements = stringURL.split(separator: "=")
        let videoID = videoElements.count > 1 ? videoElements[1] : ""
        
        if !videoID.isEmpty {
            videoView.delegate = self
            videoView.load(withVideoId: String(videoID),
                           playerVars: ["playsinline":1])
        }
        
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "", message: mealDetailVM.errorMessage, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

extension RecipeDetailVC:YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
}
