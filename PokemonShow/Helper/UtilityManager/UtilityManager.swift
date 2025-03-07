//
//  UtilityManager.swift
//  PokemonShow
//
//  Created by MacBook on 3/7/25.
//

import Foundation
import UIKit

class UtilitiesManager {
    static let shared = UtilitiesManager()
    let defaults = UserDefaults.standard
    
    var UserName: String? {
        get {
            return UserDefaults.standard.string(forKey: "userName")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "userName")
        }
    }
    
    var userEmail: String? {
        get {
            return UserDefaults.standard.string(forKey: "userEmail")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "userEmail")
        }
    }
}
