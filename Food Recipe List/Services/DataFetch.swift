//
//  DataFetch.swift
//  Food Recipe List
//
//  Created by Daniel Eir on 20/07/22.
//

import Foundation
struct DataFetch {
    
    static func getRecipeData() -> [Recipe]{
        //Gets a string of the path for the data.json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        //safety checks if pathString is nil
        guard pathString != nil else{
            return [Recipe]()
        }
        //Creates url object with the data.json file
        let url = URL(fileURLWithPath: pathString!)
        do{
            //Creates data object with the contents of the url (data.json)
            let data = try Data(contentsOf: url)
            
            //Creates a decoder object
            let decoder = JSONDecoder()
            do {
                //Decodes the data object into an array of recipe
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //For each recipe in recipeData, assign a unique id.
                for recipe in recipeData{
                    recipe.id = UUID()
                    for ingredient in recipe.ingredients{
                        ingredient.id = UUID()
                    }
                }
                //Return a recipe array.
                return recipeData
            }
            //catches any decoding error
            catch{
                print(error)
            }
            
        }
        //catches any error when we create a data object
        catch{
            print(error)
        }
        //return empty recipe array
        return [Recipe]()
        
        
    }
}
