//
//  UIViewController+Ext.swift
//  MovieBox-MVC
//
//  Created by Kafein on 24.08.2022.
//

import UIKit

extension UIViewController {
    func showNavigationBar(){
        let backButton = UIBarButtonItem()
        backButton.title = "Movies"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func hideNavigationBar(){
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
