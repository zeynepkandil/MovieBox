//
//  MovieCell.swift
//  MovieBox-MVC
//
//  Created by Kafein on 22.08.2022.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    static let identifier = "MovieCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MovieCell", bundle: nil)
    }
    
    var postImageURL: String? {
        didSet {
            if let url = postImageURL {
                self.movieImageView.image = UIImage(named: "loading")
                
                UIImage.loadImageUsingCacheWithUrlString(url) { image in
                    // set the image only when we are still displaying the content for the image we finished downloading
                    if url == self.postImageURL {
                        self.movieImageView.image = image
                    }
                }
            }
            else {
                self.movieImageView.image = nil
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
