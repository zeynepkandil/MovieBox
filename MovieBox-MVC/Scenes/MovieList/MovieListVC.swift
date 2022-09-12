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
    var results = [Movie]()
    var movieQueryValue = String()
    var pageNumber = 1
    
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

    func searchMovie(movieName: String, pageNumber: Int){
        app.hud.show(in: self.view, animated: true)
        app.networkManager.searchMovie(name: movieName, pageNumber: pageNumber) { result in
            app.hud.dismiss(animated: true)
            switch result {
            case .success(let response):
                self.searchResponse = response
                self.results.append(contentsOf: response.results)
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
            cell.titleLabel.text = results[indexPath.row].title
            cell.descLabel.text = results[indexPath.row].overview
            cell.postImageURL = String(format: "https://image.tmdb.org/t/p/original%@", results[indexPath.row].posterPath)
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = results[indexPath.row]
        let detailVC = app.router.getMovieDetailVC(movie: movie)
        self.navigationController?.title = movie.title
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == results.count - 1 && results.count % 20 == 0 {
            pageNumber += 1
            searchMovie(movieName: self.movieQueryValue, pageNumber: self.pageNumber)
        }
    }
    
}

extension MovieListVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count > 0 {
            pageNumber = 1
            movieQueryValue = searchText
            
            searchMovie(movieName: movieQueryValue, pageNumber: self.pageNumber)
        }
    }
    
}
