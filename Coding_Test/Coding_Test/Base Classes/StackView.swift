//
//  StackView.swift
//  Coding_Test
//
//  Created by Vinod on 20/03/22.
//

import UIKit

class StackView: UIStackView {
    
    static let horizontalMargin = CGFloat(25)

    init(alongAxis a: NSLayoutConstraint.Axis = .vertical, majorAxisSpacing: CGFloat? = 20, minorAxisSpacing: CGFloat? = 25) {

        super.init(frame: .zero)

        distribution = .fill
        layer.cornerRadius = 10
        spacing = majorAxisSpacing ?? CGFloat(0)

        axis = a

        let verticalSpacing = (a == .vertical ? spacing : minorAxisSpacing) ?? CGFloat(0)
        let horizontalSpacing = (a == .horizontal ? spacing : minorAxisSpacing) ?? CGFloat(0)

        layoutMargins = UIEdgeInsets(
            top: verticalSpacing,
            left: horizontalSpacing,
            bottom: verticalSpacing,
            right: horizontalSpacing
        )
        isLayoutMarginsRelativeArrangement = true
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
