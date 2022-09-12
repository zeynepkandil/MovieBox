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
        
        movieListVC.tabBarItem = UITabBarItem.init(title: "Movies", image: UIImage(systemName: "film"), selectedImage: UIImage(systemName: "film.fill"))
        
        favoritesVC.tabBarItem = UITabBarItem.init(title: "Favorites", image: UIImage(systemName: "heart" ), selectedImage: UIImage(systemName: "heart.fill"))
        
        upcomingMoviesVC.tabBarItem = UITabBarItem.init(title: "Upcoming", image: UIImage(systemName: "list.bullet.rectangle"), selectedImage: UIImage(systemName: "list.bullet.rectangle.fill"))
                
        self.setViewControllers([movieListVC,favoritesVC,upcomingMoviesVC], animated: true)
    }

}
