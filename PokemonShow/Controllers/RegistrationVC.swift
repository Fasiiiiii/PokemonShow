//
//  RegistrationVC.swift
//  PokemonShow
//
//  Created by MacBook on 3/7/25.
//

import UIKit

class RegistrationVC: UIViewController {

    @IBOutlet weak var viewUserName: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewBtnRegister: UIView!
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

    }
    

    @IBAction func btnRegisterTapped(_ sender: Any) {
        checkValidation()
    }
    
    
    func setupUI() {
        viewUserName.layer.cornerRadius = 10
        viewUserName.layer.borderWidth = 1
        viewUserName.layer.borderColor = UIColor.black.cgColor
        viewEmail.layer.cornerRadius = 10
        viewEmail.layer.borderWidth = 1
        viewEmail.layer.borderColor = UIColor.black.cgColor
        viewBtnRegister.layer.cornerRadius = 10
        
    }
    
    func checkValidation() {
        guard let userName = tfUserName.text?.trimmingCharacters(in: .whitespacesAndNewlines), !userName.isEmpty else {
            showAlert(title: "Error", message: "Username cannot be empty.")
            return
        }
        
        guard let email = tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty else {
            showAlert(title: "Error", message: "Email cannot be empty.")
            return
        }
        
        UtilitiesManager.shared.UserName = userName
        UtilitiesManager.shared.userEmail = email
        
        navigateToNextController()
    }
    
    func navigateToNextController() {
        guard let tabBarController = storyboard?.instantiateViewController(withIdentifier: "TabbarController") as? UITabBarController else {
            print("Could not instantiate TabBarController")
            return
        }
        
        tabBarController.selectedIndex = 0
        navigationController?.pushViewController(tabBarController, animated: true)
        
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
