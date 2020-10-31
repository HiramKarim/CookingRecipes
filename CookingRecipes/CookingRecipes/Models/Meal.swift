//
//  Meal.swift
//  CookingRecipes
//
//  Created by Hiram Castro on 10/31/20.
//

import Foundation

struct Meal:Codable {
    let meals:[MealData]?
}

struct MealData:Codable {
    let idMeal:String?
    let strMeal:String?
    let strDrinkAlternate:String?
    let strCategory:String?
    let strArea:String?
    let strInstructions:String?
    let strMealThumb:String?
    let strTags:String?
    let strYoutube:String?
    let strIngredient1:String?
    let strIngredient2:String?
    let strIngredient3:String?
    let strIngredient4:String?
    let strIngredient5:String?
    let strIngredient6:String?
    let strIngredient7:String?
    let strIngredient8:String?
    let strIngredient9:String?
    let strIngredient10:String?
    let strIngredient11:String?
    let strIngredient12:String?
    let strIngredient13:String?
    let strIngredient14:String?
    let strIngredient15:String?
    let strIngredient16:String?
    let strIngredient17:String?
    let strIngredient18:String?
    let strIngredient19:String?
    let strIngredient20:String?
    let strSource:String?
    let dateModified:String?
}

extension MealData {
    static var searchMeal:Resource<Meal> = {
        guard let url = URL(string: API.searchMealURL) else { fatalError("URL is incorrect!") }
        return Resource<Meal>(url: url)
    }()
    
    static var lookupMeal:Resource<Meal> = {
        guard let url = URL(string: API.lookupMealURL) else { fatalError("URL is incorrect!") }
        return Resource<Meal>(url: url)
    }()
}
