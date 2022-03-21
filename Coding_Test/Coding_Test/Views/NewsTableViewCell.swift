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
    let titleLabel = TitleLabel(font: .boldSystemFont(ofSize: 16), textColor: .black)
    let subTitleLabel = SubTitleLabel(font: .systemFont(ofSize: 14), textColor: .black)
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func prepareUI() {
        selectionStyle = .none
        contentView.addSubview(containerStackView)
        [newsImage, titleLabel, subTitleLabel].forEach {containerStackView.addArrangedSubview($0)}
        subTitleLabel.numberOfLines = 0
        
        // add constraints
        containerStackView.makeConstraintsWithContainer(contentView) { stackview, container in
            stackview.edges.equalTo(container.edges)
        }
        newsImage.makeConstraintsWithSelf { $0.height.equalTo(150)}
        newsImage.layer.cornerRadius = 10.0
        newsImage.clipsToBounds = true
        
    }
    
}

extension NewsTableViewCell{
    func populateNews(article: Article?) {
        guard let article = article else {
            return
        }
        titleLabel.text = article.author
        subTitleLabel.text = article.title
        newsImage.loadImage(url: article.urlToImage ?? "")
    }
}
