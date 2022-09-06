//
//  Array+Ext.swift
//  MovieBox-MVC
//
//  Created by Kafein on 6.09.2022.
//

import Foundation

extension Array where Element: Equatable{
    mutating func removeObject(element: Element) {
        if let i = self.firstIndex(of: element) {
            self.remove(at: i)
        }
    }
}
