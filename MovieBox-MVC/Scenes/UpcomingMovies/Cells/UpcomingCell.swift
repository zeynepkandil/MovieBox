//
//  UpcomingCell.swift
//  MovieBox-MVC
//
//  Created by Kafein on 25.08.2022.
//

import UIKit

class UpcomingCell: UITableViewCell {
    
    @IBOutlet weak var upcomingImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    static let identifier = "UpcomingCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "UpcomingCell", bundle: nil)
    }
    
    
    var postImageURL: String? {
        didSet {
            if let url = postImageURL {
                self.upcomingImageView.image = UIImage(named: "loading")
                
                UIImage.loadImageUsingCacheWithUrlString(url) { image in
                    // set the image only when we are still displaying the content for the image we finished downloading
                    if url == self.postImageURL {
                        self.upcomingImageView.image = image
                    }
                }
            }
            else {
                self.upcomingImageView.image = nil
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
