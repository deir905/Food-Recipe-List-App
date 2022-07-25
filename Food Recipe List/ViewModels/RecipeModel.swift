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
}
