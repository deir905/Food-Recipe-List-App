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
    @State var selectedIndex:Int = 6
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                //Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                //Serving picker
                VStack (alignment: .leading){
                    Text("Select your serving size:")
                        .font(.headline)
                    Picker("",selection: $selectedIndex) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(SegmentedPickerStyle())
                        .frame(width:160)
                }
                .padding()
                Divider()
                //Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                    ForEach (recipe.ingredients){ ingredient in

                        Text("• " + RecipeModel.getPortion(recipe: recipe, ingredient: ingredient, portionSize: selectedIndex) + " " + ingredient.name)
                            .padding(.leading, 5.0)
                        
                    }
                }.padding(.horizontal)
                Divider()
                //Directions
                VStack(alignment: .leading){
                    Text("Directions").font(.headline)
                    ForEach (0..<recipe.directions.count, id:\.self){ index in
                        
                        Text("\(String(index+1)). \(recipe.directions[index])")
                            .padding([.leading, .bottom], 5.0)
                        
                    }
                }.padding(.horizontal)
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
