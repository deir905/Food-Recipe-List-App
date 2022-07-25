//
//  RecipeDetailedView.swift
//  Food Recipe List
//
//  Created by Daniel Eir on 20/07/22.
//

import SwiftUI

struct RecipeDetailedView: View {
    //need to initialise this variable
    var recipe:Recipe
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                //Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                //Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                    ForEach (recipe.ingredients, id:\.self){ item in

                        Text("• " + item)
                            .padding(.leading, 5.0)
                        
                    }
                }
                Divider()
                //Directions
                VStack(alignment: .leading){
                    Text("Directions").font(.headline)
                    ForEach (0..<recipe.directions.count, id:\.self){ index in
                        
                        Text("\(String(index+1)). \(recipe.directions[index])")
                            .padding([.leading, .bottom], 5.0)
                        
                    }
                }
            }
        }.navigationBarTitle(Text(recipe.name))
    }
}

struct RecipeDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()

        RecipeDetailedView(recipe: model.recipes[0])
    }
}
