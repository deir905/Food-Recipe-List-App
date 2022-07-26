//
//  ContentView.swift
//  Food Recipe List
//
//  Created by Daniel Eir on 20/07/22.
//

import SwiftUI

struct RecipeListView: View {
    //The ViewModel this View is going to be using
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        NavigationView{
            VStack(alignment:.leading, spacing: 0){
                Text("Recipe List")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 40)
                ScrollView{
                    LazyVStack (alignment: .leading){
                        ForEach (model.recipes){recipe in
                            NavigationLink(destination: {
                                RecipeDetailedView(recipe: recipe)
                            }, label: {
                                HStack (spacing: 20){
                                    Image(recipe.image)
                                        .resizable()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                        .cornerRadius(5)
                                    VStack(alignment: .leading){
                                        Text(recipe.name)
                                            .foregroundColor(.black)
                                            .bold()
                                        Text(RecipeModel.getHighlightString(recipe: recipe))
                                            .foregroundColor(.black)
                                    }
                                }
                            })
                        }
                    }
                }
            }.navigationBarHidden(true)
                .padding(.leading)
            
        }
    }
    
    struct RecipeListView_Previews: PreviewProvider {
        static var previews: some View {
            RecipeListView()
        }
    }
}
