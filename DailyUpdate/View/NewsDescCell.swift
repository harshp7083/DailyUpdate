//
//  NewsDescCellTableViewCell.swift
//  DailyUpdate
//
//  Created by Jigmet stanzin Dadul on 22/06/23.
//

import UIKit

class NewsDescCell: UITableViewCell {

    
    @IBOutlet weak var newsCellView: UIView!
    
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var newsDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        newsImage.image = UIImage(named: "LetterNLine")
        
        
        
        
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
