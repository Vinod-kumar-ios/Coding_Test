//
//  UIViewController.swift
//  Coding_Test
//
//  Created by Vinod on 20/03/22.
//

import UIKit

extension UIViewController{
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction.init(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        DispatchQueue.main.async {[weak self] in
            self?.present(alert, animated: true, completion: nil)
        }
    }
}
