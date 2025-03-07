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
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = scene.windows.first,
           let topVC = window.rootViewController {
            topVC.present(alert, animated: true, completion: nil)
        }
    }
}
