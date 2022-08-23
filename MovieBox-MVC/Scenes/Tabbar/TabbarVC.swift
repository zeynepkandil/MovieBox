//
//  TabbarVC.swift
//  MovieBox-MVC
//
//  Created by Kafein on 22.08.2022.
//

import UIKit

class TabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabbar()
    }
    
    func setupTabbar() {
        let movieListVC = app.router.getMovieListVC()
        let movieDetailVC = app.router.getMovieDetailVC()
        let favoritesVC = app.router.getFavoritesVC()
        
        movieListVC.tabBarItem = UITabBarItem.init(title: "Movies", image: UIImage(named: "contacts-passive"), selectedImage: UIImage(named: "contacts-passive"))
        
        movieDetailVC.tabBarItem = UITabBarItem.init(title: "Detail", image: UIImage(named: "contacts-passive"), selectedImage: UIImage(named: "contacts-passive"))
        
        favoritesVC.tabBarItem = UITabBarItem.init(title: "Favorites", image: UIImage(named: "contacts-passive"), selectedImage: UIImage(named: "contacts-passive"))
                
        self.setViewControllers([movieListVC,movieDetailVC,favoritesVC], animated: true)
    }

}
