//
//  RecipeFeaturedView.swift
//  Food Recipe List
//
//  Created by Daniel Eir on 26/07/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model:RecipeModel
    @State var tabIndex:Int = 0
    @State var isDetailedViewShowing:Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing:0){
            //Title
            Text("Featured Recipes")
                .font(.largeTitle)
                .bold()
                .padding(.leading)
                .padding(.top, 40)
            
            //Cards
            GeometryReader{ geo in
                TabView (selection: $tabIndex){
                    // Cycle through each Recipe and create a card if featured is true
                    ForEach (0..<model.recipes.count) { index in
                        if model.recipes[index].featured{
                            
                            //Create a Card
                            Button(action: {
                                self.isDetailedViewShowing = true}
                                   , label: {
                                ZStack{
                                    Rectangle().foregroundColor(.white)
                                    VStack(spacing: 0){
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                            .foregroundColor(.black)
                                    }
                                }
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailedViewShowing, content: {
                                RecipeDetailedView(recipe: model.recipes[index])
                            })
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(15)
                                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            
            //Preparation Time & Highlights
            VStack(alignment: .leading, spacing: 0){
                Text("Preparation Time:")
                    .font(.headline)
                Text(model.recipes[tabIndex].prepTime)
                Text("Highlights:")
                    .font(.headline)
                Text(RecipeModel.getHighlightString(recipe: model.recipes[tabIndex]))
            }.padding(.leading)
        }
        .onAppear(perform: {
            setFirstFeaturedIndex()
        })
    }
    
    func setFirstFeaturedIndex(){
        let index = model.recipes.firstIndex(where: {recipe in
            recipe.featured == true
        })
        tabIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()          .environmentObject(RecipeModel())
    }
}
