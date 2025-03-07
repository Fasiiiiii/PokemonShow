//
//  SettingsVC.swift
//  PokemonShow
//
//  Created by MacBook on 3/7/25.
//

import UIKit

class SettingsVC: UIViewController {


    @IBOutlet weak var viewUserName: UIView!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var viewBtnUpdate: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func btnUpdateTapped(_ sender: UIButton) {
        checkValidation()
    }
    
    
    func setupUI() {
        viewUserName.layer.cornerRadius = 10
        viewUserName.layer.borderWidth = 1
        viewUserName.layer.borderColor = UIColor.black.cgColor
        viewEmail.layer.cornerRadius = 10
        viewEmail.layer.borderWidth = 1
        viewEmail.layer.borderColor = UIColor.black.cgColor
        viewBtnUpdate.layer.cornerRadius = 10
        viewBtnUpdate.layer.borderWidth = 1
        viewBtnUpdate.layer.borderColor = UIColor.systemYellow.cgColor
        
        tfEmail.text = UtilitiesManager.shared.userEmail
        tfUsername.text = UtilitiesManager.shared.UserName
    }

    func checkValidation() {
        guard let userName = tfUsername.text?.trimmingCharacters(in: .whitespacesAndNewlines), !userName.isEmpty else {
            showAlert(title: "Error", message: "Username cannot be empty.")
            return
        }
        
        guard let email = tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty else {
            showAlert(title: "Error", message: "Email cannot be empty.")
            return
        }
        
        UtilitiesManager.shared.UserName = userName
        UtilitiesManager.shared.userEmail = email
        
        showAlert(title: "Success!", message: "Details updated successfully")
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
