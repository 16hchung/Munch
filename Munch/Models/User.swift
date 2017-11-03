//
//  File.swift
//  Munch
//
//  Created by Heejung Chung on 11/3/17.
//  Copyright © 2017 hjchung. All rights reserved.
//

import Foundation

enum FoodPreference: String {
    case  drinks, EANABs, accepts_meal_plan_dollars, dining_hall, American, Asian, Italian, Mexican, Healthy, Vegetarian, Vegan
    
    static func allOnCampusPreferences() -> [FoodPreference] {
        return [.EANABs, .accepts_meal_plan_dollars, .dining_hall]
    }

    static func allOffCampusPreferences() -> [FoodPreference] {
        return [.drinks, .American, .Asian, .Italian, .Mexican, .Healthy, .Vegetarian, .Vegan]
    }

    static func allPreferences() -> [FoodPreference] {
        let onCampus  = Set(allOnCampusPreferences())
        let offCampus = Set(allOffCampusPreferences())
        let prefSet = onCampus.union(offCampus)
        return Array(prefSet)
    }
}

class User {
    
}
