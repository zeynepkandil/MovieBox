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
    
    var movie : Results?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
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
        self.showNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.hideNavigationBar()
    }
    

   

}
