//
//  AppContainer.swift
//  MovieBox-MVC
//
//  Created by Kafein on 17.08.2022.
//

import Foundation

let app = AppContainer()

final class AppContainer {
    
    let networkManager = NetworkManager()
    let router = AppRouter()
    let defaults = UserDefaultsManager()
    
}
