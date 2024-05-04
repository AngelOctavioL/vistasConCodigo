//
//  LoginViewController.swift
//  Fakestagram
//
//  Created by Grecia Escárcega on 12/04/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBAction func manualSegueHome(_ sender: UIButton) {
        homeViewUsingXIB()
    }
    
    private func homeViewUsingStoryboard() {
        guard let homeNavigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeNavigationController") as? UINavigationController else { return }
        if let userName = userNameTextField.text, !userName.isEmpty {
            homeNavigationController.topViewController?.navigationItem.title = "Welcome, " + userName.capitalized
        } else {
            homeNavigationController.topViewController?.navigationItem.title = "Welcome"
        }
        present(homeNavigationController, animated: true)
    }
    
    private func homeViewUsingXIB() {
        // ocupando el nuevo HomeViewController
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.modalPresentationStyle = .fullScreen
        homeNavigationController.navigationBar.prefersLargeTitles = true
        if let userName = userNameTextField.text, !userName.isEmpty {
            homeNavigationController.topViewController?.navigationItem.title = "Welcome, " + userName.capitalized
        } else {
            homeNavigationController.topViewController?.navigationItem.title = "Welcome"
        }
        present(homeNavigationController, animated: true)
    }
    
}
