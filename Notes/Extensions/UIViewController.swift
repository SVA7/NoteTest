//
//  UIViewController.swift
//  Notes
//
//  Created by SV_A7 on 26.09.17.
//  Copyright © 2017 SV_A7. All rights reserved.

import UIKit

extension UIViewController {

    // MARK: - Alerts

    func showAlert(with title: String, and message: String) {
        // Initialize Alert Controller
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        // Configure Alert Controller
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        // Present Alert Controller
        present(alertController, animated: true, completion: nil)
    }

}
