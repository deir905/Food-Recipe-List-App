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
            List(model.recipes) { r in
                
                NavigationLink(destination: RecipeDetailedView(recipe: r), label: {
                
                    HStack(spacing: 20.0){
                    Image(r.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: .center)
                        .clipped()
                        .cornerRadius(5)
                        Text(r.name)
                    }
                })
            }.navigationBarTitle(Text("Recipes"))
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
