//
//  TitleLabel.swift
//  Coding_Test
//
//  Created by Vinod on 20/03/22.
//

import UIKit

class TitleLabel: UILabel {
    
    init(font: UIFont, textColor: UIColor) {
        super.init(frame: .zero)
        self.font = font
        self.textColor = textColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

}
