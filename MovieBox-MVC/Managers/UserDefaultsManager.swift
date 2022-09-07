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
    
    var favouriteMovies: [Movie]? = [Movie]()
    
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
    
    func saveFavouriteMovie(movie: Movie) {
        favouriteMovies?.append(movie)
        defaults.set(try? PropertyListEncoder().encode(favouriteMovies), forKey: "favourites")
        defaults.synchronize()
    }
    func removeFavouriteMovie(movie: Movie){
        let movies = getFavouriteMovies()
        guard var movies = movies else {
            return
        }
        
        for m in movies {
            if movie.id == m.id {
                movies.removeObject(element: movie)
                defaults.set(try? PropertyListEncoder().encode(movies), forKey: "favourites")
            }
        }
    }
    func removeAllFavourites(){
        defaults.set(nil, forKey: "favourites")
    }
    func getFavouriteMovies() -> [Movie]? {
        if let data = defaults.value(forKey:"favourites") as? Data {
            let movies = try? PropertyListDecoder().decode(Array<Movie>.self, from: data)
            return movies
        }
        
        return nil
    }
    
    //Note: Single json object saving example
    //MARK: --- Movie
    public func saveMovie(movie: Movie?) {
        if let encoded = try? jsonEncoder.encode(movie) {
            defaults.set(encoded, forKey: "movie")
            defaults.synchronize()
        }
    }
    public func removeMovie(){
        UserDefaults.standard.set(nil, forKey:"movie")
    }
    public func getMovie() -> Movie? {
        if let savedMovie = defaults.object(forKey: "movie") as? Data {
            if let movie = try? jsonDecoder.decode(Movie.self, from: savedMovie) {
                return movie
            }
        }
        return nil
    }
    
    
}
