//
//  RecipeTabView.swift
//  Food Recipe List
//
//  Created by Daniel Eir on 26/07/22.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView{
            RecipeFeaturedView().tabItem {
                VStack{
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
            }
            RecipeListView().tabItem {
                VStack{
                    Image(systemName: "list.bullet")
                    Text("Lists")
                }
            }
        }.environmentObject(RecipeModel())

    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
