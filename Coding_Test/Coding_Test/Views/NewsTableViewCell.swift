//
//  NewsTableViewCell.swift
//  Coding_Test
//
//  Created by Vinod on 20/03/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    let titleLable = TitleLabel.init(font: .boldSystemFont(ofSize: 16), textColor: .white)

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
