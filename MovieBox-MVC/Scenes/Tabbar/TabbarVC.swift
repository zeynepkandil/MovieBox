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
        let favoritesVC = app.router.getFavoritesVC()
        let upcomingMoviesVC = app.router.getUpcomingMoviesVC()
        
        movieListVC.tabBarItem = UITabBarItem.init(title: "Movies", image: UIImage(named: "contacts-passive"), selectedImage: UIImage(named: "contacts-passive"))
        
        favoritesVC.tabBarItem = UITabBarItem.init(title: "Favorites", image: UIImage(named: "contacts-passive"), selectedImage: UIImage(named: "contacts-passive"))
        
        upcomingMoviesVC.tabBarItem = UITabBarItem.init(title: "Upcoming", image: UIImage(named: "contacts-passive"), selectedImage: UIImage(named: "contacts-passive"))
                
                
        self.setViewControllers([movieListVC,favoritesVC,upcomingMoviesVC], animated: true)
    }

}
