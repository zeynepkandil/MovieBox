//
//  UserDefaultsManager.swift
//  MovieBox-MVC
//
//  Created by Kafein on 23.08.2022.
//

import Foundation

class UserDefaultsManager {
    
    let jsonEncoder = JSONEncoder()
    let jsonDecoder = JSONDecoder()
    let defaults = UserDefaults.standard
    
    var favouriteMovies: [Results]?
    
    //MARK: --- AccessToken
    public func setAccessToken(accessToken: String?) {
        defaults.set(accessToken, forKey:"accessToken")
        defaults.synchronize()
    }
    public func removeAccessToken(){
        defaults.set(nil, forKey:"accessToken")
    }
    public func getAccessToken() -> String? {
        return defaults.value(forKey: "accessToken") as? String
    }
    
    func saveFavouriteMovie(movie: Results) {
        favouriteMovies?.append(movie)
        defaults.set(favouriteMovies, forKey: "favourites")
        defaults.synchronize()
    }
    func removeFavouriteMovie(movie: Results){
        let movies = getFavouriteMovies()
        guard var movies = movies else {
            return
        }
        
        for m in movies {
            if movie.id == m.id {
                movies.removeObject(element: movie)
                defaults.set(movies, forKey: "favourites")
            }
        }
    }
    func removeAllFavourites(){
        defaults.set(nil, forKey: "favourites")
    }
    func getFavouriteMovies() -> [Results]? {
        if let _ = favouriteMovies {
            return defaults.value(forKey: "favourites") as? [Results]
        }

        return nil
    }
    
    
}
