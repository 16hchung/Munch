//
//  File.swift
//  Munch
//
//  Created by Heejung Chung on 11/3/17.
//  Copyright © 2017 hjchung. All rights reserved.
//

import Foundation

class User {
    
    // MARK: - PROPERTIES
    
    let uid: Int
    let name: String
    var email: String
    var phone: String
    var foodPreferences: Set<FoodPreference>?
    var timesAvailable: Set<TimePeriod>?
    var pastMunches: [Munch]?
    var currentMunch: Munch?
    
    // current user property
    private static var _current: User?
    
    static var current: User? {
        guard let currentUser = _current else {
            print("current user doesn't exist")
            return nil
        }
        return currentUser
    }
    
    static func setCurrent(_ user: User) {
        _current = user
    }
    
    init(uid: Int, name: String, email: String, phone: String) {
        self.uid = uid
        self.name = name
        self.email = email
        self.phone = phone
    }
    
}
