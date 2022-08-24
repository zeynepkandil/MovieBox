//
//  AppContainer.swift
//  MovieBox-MVC
//
//  Created by Kafein on 17.08.2022.
//

import Foundation
import JGProgressHUD

let app = AppContainer()

final class AppContainer {
    
    let networkManager = NetworkManager()
    let router = AppRouter()
    let defaults = UserDefaultsManager()
    let hud = JGProgressHUD()
    
}
