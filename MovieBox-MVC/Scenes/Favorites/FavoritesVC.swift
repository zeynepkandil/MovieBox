//
//  FavoritesVC.swift
//  MovieBox-MVC
//
//  Created by Kafein on 22.08.2022.
//

import UIKit

class FavoritesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var movies : [Movie] = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchFavouriteMovies()
    }
    
    func prepareUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FavouriteCell.nib(), forCellReuseIdentifier: FavouriteCell.identifier)
    }
    
    func fetchFavouriteMovies(){
        let favouriteMovies = app.defaults.getFavouriteMovies()
        print("Favoriler", favouriteMovies)
        guard let favouriteMovies = favouriteMovies else {
            return
        }
        
        movies = favouriteMovies
        
    }

}

extension FavoritesVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteCell.identifier, for: indexPath) as? FavouriteCell{
            cell.movieLabel.text = movies[indexPath.row].title + "      " + String(movies[indexPath.row].voteAverage) + " / 10"
            return cell
        }
        return UITableViewCell()
    }
    
   
    
}
