//
//  UpcomingMoviesVC.swift
//  MovieBox-MVC
//
//  Created by Kafein on 25.08.2022.
//

import UIKit

class UpcomingMoviesVC : UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var upcomingMoviesResponse : UpcomingMoviesResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareUI()
        upcomingMovies()


        // Do any additional setup after loading the view.
    }


    func prepareUI(){
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UpcomingCell.nib(), forCellReuseIdentifier: UpcomingCell.identifier)

    }

    func upcomingMovies(){
        app.networkManager.upcomingMovies { result in
            switch result {
            case.success(let response):
                self.upcomingMoviesResponse = response
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }


        }

    }
}

extension UpcomingMoviesVC : UITableViewDataSource,UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movies = upcomingMoviesResponse?.results {
            return movies.count
        }
          return 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingCell.identifier, for: indexPath) as? UpcomingCell{
            if let movies = upcomingMoviesResponse?.results {
                cell.nameLabel.text = movies[indexPath.row].title
                cell.dateLabel.text = movies[indexPath.row].releaseDate
                cell.postImageURL = String(format: "https://image.tmdb.org/t/p/original%@", movies[indexPath.row].posterPath)
                return cell
            }
        }
        return UITableViewCell()

    }
    
    }

