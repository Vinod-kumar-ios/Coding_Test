//
//  NewsTableViewCell.swift
//  Coding_Test
//
//  Created by Vinod on 20/03/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    let containerStackView = StackView.init(alongAxis: .vertical, majorAxisSpacing: 15, minorAxisSpacing: 15)
    
    let newsImage = UIImageView()
    let titleLable = TitleLabel(font: .boldSystemFont(ofSize: 16), textColor: .white)
    let subTitleLable = SubTitleLabel(font: .boldSystemFont(ofSize: 16), textColor: .white)
    
    
    func prepareUI() {
        selectionStyle = .none
        contentView.addSubview(containerStackView)
        [newsImage, titleLable, subTitleLable].forEach {containerStackView.addArrangedSubview($0)}
        subTitleLable.numberOfLines = 0
        
        
        // add constraints
        containerStackView.makeConstraintsWithContainer(contentView) { stackview, container in
            stackview.edges.equalTo(container.edges)
        }
    }
    
}
