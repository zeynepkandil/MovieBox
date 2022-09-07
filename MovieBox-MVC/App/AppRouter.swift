//
//  AppRouter.swift
//  MovieBox-MVC
//
//  Created by Kafein on 22.08.2022.
//

import Foundation
import UIKit

final class AppRouter {
    
    var window: UIWindow? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let delegate = windowScene.delegate as? SceneDelegate, let window = delegate.window else { return nil }
        return window
    }
    
    var navigationController = UINavigationController()
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var sceneDelegate: SceneDelegate? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let delegate = windowScene.delegate as? SceneDelegate else { return nil }
        return delegate
    }
    
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated else {
            sceneDelegate?.window?.rootViewController = vc
            sceneDelegate?.window?.makeKeyAndVisible()
            return
        }
        
        sceneDelegate?.window?.rootViewController = vc
        sceneDelegate?.window?.makeKeyAndVisible()
        UIView.transition(with: self.window!,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
    
    func setRootViewControllerWithNavigation(viewController: UIViewController){
        navigationController = UINavigationController(rootViewController: viewController)
        navigationController.setNavigationBarHidden(true, animated: false)
        setRootViewController(navigationController, animated: true)
    }
    
    func goToTabbar() {
        let storyboard = UIStoryboard(name: "Tabbar", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TabbarVC") as! TabbarVC
        viewController.modalPresentationStyle = .fullScreen
        navigationController = UINavigationController(rootViewController: viewController)
        navigationController.setNavigationBarHidden(true, animated: false)
        setRootViewController(navigationController)
    }
    
    func goToLoginVC() {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        viewController.modalPresentationStyle = .fullScreen
        navigationController = UINavigationController(rootViewController: viewController)
        navigationController.setNavigationBarHidden(true, animated: false)
        setRootViewController(navigationController)
    }
    
    func getMovieListVC() -> MovieListVC {
        let storyboard = UIStoryboard(name: "Tabbar", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieListVC") as! MovieListVC
        return viewController
    }
    
    func getMovieDetailVC(movie: Movie) -> MovieDetailVC {
        let storyboard = UIStoryboard(name: "Tabbar", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailVC
        viewController.movie = movie
        return viewController
    }
    
    func getFavoritesVC() -> FavoritesVC {
        let storyboard = UIStoryboard(name: "Tabbar", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FavoritesVC") as! FavoritesVC
        return viewController
    }
    
    func getUpcomingMoviesVC() -> UpcomingMoviesVC {
        let storyboard = UIStoryboard(name: "Tabbar", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "UpcomingMoviesVC") as! UpcomingMoviesVC
        return viewController
    }
    
}
