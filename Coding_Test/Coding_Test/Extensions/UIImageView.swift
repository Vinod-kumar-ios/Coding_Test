//
//  UIImageView.swift
//  Coding_Test
//
//  Created by Vinod on 20/03/22.
//

import UIKit
import Kingfisher

extension UIImageView{
    func loadImage(url: String) {
        let url = URL(string: url)
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"), options: [.transition(.fade(1)),.cacheOriginalImage], completionHandler: nil)
    }
}
