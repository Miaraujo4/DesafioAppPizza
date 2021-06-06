//
//  SucessViewController.swift
//  AppPizza
//
//  Created by Milena Pereira de Araujo on 05/06/21.
//

import UIKit

class SucessViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        for viewController in navigationController!.viewControllers {
            if viewController.isKind(of: ChoiceViewController.self) {
                self.navigationController?.popToViewController(viewController, animated: true)
            }
        }
    }
}

