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
            UtilitiesManager.shared.showAlert(title: "Error", message: "Username cannot be empty.")
            return
        }
        
        guard let email = tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty else {
            UtilitiesManager.shared.showAlert(title: "Error", message: "Email cannot be empty.")
            return
        }
        
        UtilitiesManager.shared.UserName = userName
        UtilitiesManager.shared.userEmail = email
        
        UtilitiesManager.shared.showAlert(title: "Success!", message: "Details updated successfully")
    }
    
    
}
