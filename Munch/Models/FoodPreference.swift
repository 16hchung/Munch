//
//  FoodPreference.swift
//  Munch
//
//  Created by Heejung Chung on 11/6/17.
//  Copyright © 2017 hjchung. All rights reserved.
//

import Foundation

enum FoodPreference: String {
    case  Drinks, EANABs, EANABs_off_campus, Accepts_meal_plan_dollars, Dining_hall, American, Asian, Italian, Mexican, Healthy, Vegetarian, Vegan
    
    static func allOnCampusPreferences() -> [FoodPreference] {
        return [.EANABs, .Accepts_meal_plan_dollars, .Dining_hall]
    }
    
    static func allOffCampusPreferences() -> [FoodPreference] {
        return [.Drinks, .EANABs_off_campus, .American, .Asian, .Italian, .Mexican, .Healthy, .Vegetarian, .Vegan]
    }
}
