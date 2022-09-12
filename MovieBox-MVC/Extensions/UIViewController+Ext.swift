//
//  UIViewController+Ext.swift
//  MovieBox-MVC
//
//  Created by Kafein on 24.08.2022.
//

import UIKit

extension UIViewController {
    func showNavigationBar(backButtonTitle: String){
        let backButton = UIBarButtonItem()
        backButton.title = backButtonTitle
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func hideNavigationBar(){
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showAlert(title:String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}
