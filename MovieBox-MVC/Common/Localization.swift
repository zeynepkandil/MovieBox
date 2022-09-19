//
//  Localization.swift
//  MovieBox-MVC
//
//  Created by Kafein on 15.09.2022.
//

import Foundation

struct Localization {
    
    static func string(key: String, defaultValue: String) -> String {
        return NSLocalizedString(key, comment: defaultValue)
    }
    
}
