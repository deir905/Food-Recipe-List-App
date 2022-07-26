//
//  RecipeModel.swift
//  Food Recipe List
//
//  Created by Daniel Eir on 20/07/22.
//

import Foundation
class RecipeModel : ObservableObject{
    @Published var recipes:[Recipe]
    
    init(){
        recipes = DataFetch.getRecipeData()
    }
    static func getHighlightString(recipe: Recipe) -> String {
        var highlightString:String = ""
        for index in 0..<recipe.highlights.count {
            highlightString.append(recipe.highlights[index])
            if (index != recipe.highlights.count-1){
                highlightString.append(", ")
            }
        }
        return highlightString
    }
    static func getPortion(recipe: Recipe, ingredient: Ingredient, portionSize: Int) -> String{
        var portion = ""
        var num = ingredient.num ?? 1
        var denom = ingredient.denom ?? 1
        
        //if denom is not nil, num must not be nil as well. OR, num is not nil, denom can maybe be nil
        if (ingredient.denom != nil || ingredient.num != nil) {
            //calculate adjusted ingredient portions needed
            denom *= recipe.servings
            num *= portionSize
            
            portion.append(String(num))
            if (denom != 1 || denom != num){
                portion.append("/" + String(denom))
            }
            if let unit = ingredient.unit{
                portion.append(" " + unit)
                if (num > denom){
                    portion.append("s")
                }
            }

            return portion
        }
        return "To Taste"
    }
}
