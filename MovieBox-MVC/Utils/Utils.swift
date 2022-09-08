//
//  Utils.swift
//  TMDb-Demo
//
//  Created by kafein on 19.08.2022.
//

import Foundation
import UIKit

final class Utils {
    
    static func formattedDateFromString(dateString: String, withFormat format: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = inputFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = format
            
            return outputFormatter.string(from: date)
        }
         
        return nil
    }
    
    static func showAlert(viewController: UIViewController,title:String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        viewController.present(alert, animated: true)
    }
    
}
