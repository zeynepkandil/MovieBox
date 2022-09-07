//
//  FavouriteCell.swift
//  MovieBox-MVC
//
//  Created by Kafein on 7.09.2022.
//

import UIKit

class FavouriteCell: UITableViewCell {
    
    @IBOutlet weak var movieLabel: UILabel!
    
    static let identifier = "FavouriteCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "FavouriteCell", bundle: nil)
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
