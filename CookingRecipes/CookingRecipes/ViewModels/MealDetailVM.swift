//
//  MealDetailVM.swift
//  CookingRecipes
//
//  Created by Hiram Castro on 10/31/20.
//

import Foundation

class MealDetailVM {
    var mealVM:[MealVM]
    var errorMessage = ""
    
    init() {
        mealVM = [MealVM]()
    }
    
    func getMealVM(at index:Int) -> MealVM? {
        return mealVM.indices.contains(index) != false ? mealVM[index] : nil
    }
}

extension MealDetailVM {
    
    func lookupMeal(_ mealID:String, completion: @escaping (Bool) -> Void) {
        
        guard let url = URL(string: API.lookupMealURL + mealID)
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
