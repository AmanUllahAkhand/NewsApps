//
//  NewsCell.swift
//  NewsApp
//
//  Created by USER on 13/09/2022.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var tittleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        newsImage.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
