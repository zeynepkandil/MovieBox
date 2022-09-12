//
//  MovieDetailVC.swift
//  MovieBox-MVC
//
//  Created by Kafein on 22.08.2022.
//

import UIKit
import Kingfisher

class MovieDetailVC: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var originalTitle: UILabel!
    @IBOutlet weak var owerviewTextView: UITextView!
    @IBOutlet weak var favouriteButton: UIButton!
    
    var movie : Movie?
    var isFavourite : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        checkFavourite()
    }
    
    func prepareUI(){
        guard let movie = movie else {
            return
        }
        movieImageView.kf.setImage(with: URL(string: String(format: "https://image.tmdb.org/t/p/original%@",movie.posterPath)))
        ratingLabel.text = String(movie.voteAverage) + "/10"
        dateLabel.text = Utils.formattedDateFromString(dateString: movie.releaseDate, withFormat: "dd.MM.yyyy")
        circleView.makeRounded()
        originalTitle.text = movie.title
        owerviewTextView.text = movie.overview
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showNavigationBar(backButtonTitle: "Movies")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.hideNavigationBar()
    }
    
    func checkFavourite(){
        let favouriteMovies = app.defaults.getFavouriteMovies()
        guard let favouriteMovies = favouriteMovies else {
            return
        }
        for m in favouriteMovies {
            if m.id == movie?.id {
                isFavourite = true
                if isFavourite {
                    favouriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                } else {
                    favouriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
                }
            }
        }
    }
    
    @IBAction func favouriteButton(_ sender: UIButton) {
        if isFavourite {
            app.defaults.removeFavouriteMovie(movie: movie!)
            favouriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            self.isFavourite = false
        } else {
            app.defaults.saveFavouriteMovie(movie: movie!)
            favouriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            self.isFavourite = true
        }
    }
    
   
    

}
