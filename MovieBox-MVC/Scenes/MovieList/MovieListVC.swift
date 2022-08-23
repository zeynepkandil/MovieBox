//
//  MovieListVC.swift
//  MovieBox-MVC
//
//  Created by Kafein on 22.08.2022.
//

import UIKit

class MovieListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchResponse: SearchMovieResponse?
    
    var movieQueryValue = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareUI()
    }
    
    func prepareUI(){
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieCell.nib(), forCellReuseIdentifier: MovieCell.identifier)
    }

    func searchMovie(movieName: String){
        app.networkManager.searchMovie(name: movieName) { result in
            switch result {
            case .success(let response):
                self.searchResponse = response
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

extension MovieListVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell {
            if let movies = searchResponse?.results {
                cell.titleLabel.text = movies[indexPath.row].title
                cell.descLabel.text = movies[indexPath.row].overview
                cell.postImageURL = String(format: "https://image.tmdb.org/t/p/original%@", movies[indexPath.row].posterPath)
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movies = searchResponse?.results {
            return movies.count
        }
        return 0
    }
    
}

extension MovieListVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count > 0 {
            movieQueryValue = searchText
            
            searchMovie(movieName: movieQueryValue)
        }
    }
    
}
