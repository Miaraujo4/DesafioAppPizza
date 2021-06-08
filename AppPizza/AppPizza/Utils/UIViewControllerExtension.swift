//
//  UIViewControllerExtension.swift
//  AppPizza
//
//  Created by Milena Pereira de Araujo on 07/06/21.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, description: String, actions: [UIAlertAction]) {
        let alert: UIAlertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        for alertAction in actions {
            alert.addAction(alertAction)
        }
        self.present(alert, animated: true, completion: nil)
    }
}
