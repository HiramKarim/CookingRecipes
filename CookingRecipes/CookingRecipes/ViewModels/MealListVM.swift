//
//  MealListVM.swift
//  CookingRecipes
//
//  Created by Hiram Castro on 10/31/20.
//

import Foundation

class MealListVM {
    var mealVM:[MealVM]
    var errorMessage = ""
    
    init() {
        mealVM = [MealVM]()
    }
    
    func getMealVM(at index:Int) -> MealVM? {
        return mealVM.indices.contains(index) != false ? mealVM[index] : nil
    }
}

extension MealListVM {
    
    func searchForMeals(_ searchText:String = "", completion: @escaping (Bool) -> Void) {
        
        guard let url = URL(string: API.searchMealURL + searchText)
        else { return }
        let mealResource = Resource<Meal>(url: url)
        
        WebService.shared().load(resource: mealResource, completion: { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                completion(false)
                break
            case .success(let meal):
                self.mealVM = meal.meals?.map(MealVM.init) ?? []
                completion(true)
                break
            }
        })
    }
    
}


struct MealVM {
    
    let meal:MealData?
    
    var idMeal:String {
        return self.meal?.idMeal ?? ""
    }
    
    var strMeal:String? {
        return self.meal?.strMeal ?? ""
    }
    
    var strDrinkAlternate:String? {
        return self.meal?.strDrinkAlternate ?? ""
    }
    
    var strCategory:String? {
        return self.meal?.strCategory ?? ""
    }
    
    var strArea:String? {
        return self.meal?.strArea ?? ""
    }
    
    var strInstructions:String? {
        return self.meal?.strInstructions ?? ""
    }
    
    var strMealThumb:String? {
        return self.meal?.strMealThumb ?? ""
    }
    
    var strTags:String? {
        return self.meal?.strTags ?? ""
    }
    
    var strYoutube:String? {
        return self.meal?.strYoutube ?? ""
    }
    
    var strIngredient1:String? {
        return self.meal?.strIngredient1 ?? ""
    }
    
    var strIngredient2:String? {
        return self.meal?.strIngredient2 ?? ""
    }
    
    var strIngredient3:String? {
        return self.meal?.strIngredient3 ?? ""
    }
    
    var strIngredient4:String? {
        return self.meal?.strIngredient4 ?? ""
    }
    
    var strIngredient5:String? {
        return self.meal?.strIngredient5 ?? ""
    }
    
    var strIngredient6:String? {
        return self.meal?.strIngredient6 ?? ""
    }
    
    var strIngredient7:String? {
        return self.meal?.strIngredient7 ?? ""
    }
    
    var strIngredient8:String? {
        return self.meal?.strIngredient8 ?? ""
    }
    
    var strIngredient9:String? {
        return self.meal?.strIngredient9 ?? ""
    }
    
    var strIngredient10:String? {
        return self.meal?.strIngredient10 ?? ""
    }
    
    var strIngredient11:String? {
        return self.meal?.strIngredient11 ?? ""
    }
    
    var strIngredient12:String? {
        return self.meal?.strIngredient12 ?? ""
    }
    
    var strIngredient13:String? {
        return self.meal?.strIngredient13 ?? ""
    }
    
    var strIngredient14:String? {
        return self.meal?.strIngredient14 ?? ""
    }
    
    var strIngredient15:String? {
        return self.meal?.strIngredient15 ?? ""
    }
    
    var strIngredient16:String? {
        return self.meal?.strIngredient16 ?? ""
    }
    
    var strIngredient17:String? {
        return self.meal?.strIngredient17 ?? ""
    }
    
    var strIngredient18:String? {
        return self.meal?.strIngredient18 ?? ""
    }
    
    var strIngredient19:String? {
        return self.meal?.strIngredient19 ?? ""
    }
    
    var strIngredient20:String? {
        return self.meal?.strIngredient20 ?? ""
    }
    
    var strSource:String? {
        return self.meal?.strSource ?? ""
    }
    
    var dateModified:String? {
        return self.meal?.dateModified ?? ""
    }
    
}
