//
//  LoginViewController.swift
//  AppPizza
//
//  Created by Milena Pereira de Araujo on 02/06/21.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Properties
    var viewModel: LoginViewModel = LoginViewModel()
    var segueIdentifier = "segueChoice"
   
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - IBAction
    @IBAction func acessButtonPressed(_ sender: Any) {
        viewModel.getAcess(email: userTextField.text ?? "", password: passwordTextField.text ?? "") { wasSuccess, error in
            DispatchQueue.main.async {
                if wasSuccess {
                    self.performSegue(withIdentifier: self.segueIdentifier, sender: nil)
                } else {
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    self.showAlert(title: error?.title ?? "", description: error?.description ?? "", actions: [okAction])
                }
            }
        }
    }
}

