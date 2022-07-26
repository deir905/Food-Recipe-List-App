//
//  Recipe.swift
//  Food Recipe List
//
//  Created by Daniel Eir on 20/07/22.
//

import Foundation
class Recipe : Decodable, Identifiable{
    //Properties
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var servings:Int
    var highlights:[String]
    var ingredients:[Ingredient]
    var directions:[String]
}
class Ingredient : Decodable, Identifiable{
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
}
