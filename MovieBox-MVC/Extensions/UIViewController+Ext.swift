//
//  UIViewController+Ext.swift
//  MovieBox-MVC
//
//  Created by Kafein on 24.08.2022.
//

import UIKit

extension UIViewController {
    func showNavigationBar(){
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func hideNavigationBar(){
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
