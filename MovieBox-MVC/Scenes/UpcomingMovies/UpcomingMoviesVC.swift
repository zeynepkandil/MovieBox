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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        upcomingMovies()
    }
    
    func prepareUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UpcomingCell.nib(), forCellReuseIdentifier: UpcomingCell.identifier)
    }
    
    func upcomingMovies(){
        app.hud.show(in: self.view, animated: true)
        app.networkManager.upcomingMovies { result in
            app.hud.dismiss(animated: true)
            switch result {
            case.success(let response):
                if let message = response.statusMessage {
                    self.showAlert(title: "ERROR", message: message)
                } else {
                    self.upcomingMoviesResponse = response
                    self.tableView.reloadData()
                    self.tableView.isHidden = false
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlert(title: "ERROR", message: "İstek zaman aşımına uğradı.")
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
                cell.dateLabel.text = Utils.formattedDateFromString(dateString: movies[indexPath.row].releaseDate, withFormat:"dd.MM.yyyy")
                cell.postImageURL = String(format: "https://image.tmdb.org/t/p/original%@", movies[indexPath.row].posterPath)
                return cell
            }
        }
        return UITableViewCell()
        
    }
    
}

