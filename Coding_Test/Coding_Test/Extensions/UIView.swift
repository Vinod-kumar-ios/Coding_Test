//
//  UIView.swift
//  Coding_Test
//
//  Created by Vinod on 20/03/22.
//

import UIKit
import SnapKit


extension UIView {

    /// Shortcut accessing `snp` attribute for `UIView` and `UILayoutGuide` when creating constraints
    /// `ConstraintAttributesDSL` has two subclasses `ConstraintViewDSL` and `ConstraintLayoutGuideDSL` that are like anchor points in SnapKit.

    func makeConstraintsWithSelf(closure: (ConstraintMaker) -> Void) {
        snp.makeConstraints {
            closure($0)
        }
    }

    func makeConstraintsWithContainer(_ container: UIView, closure: (ConstraintMaker, ConstraintAttributesDSL) -> Void) {
        snp.makeConstraints {
            closure($0, container.snp)
        }
    }

    func remakeConstraintsWithContainer(_ container: UIView, closure: (ConstraintMaker, ConstraintAttributesDSL) -> Void) {
        snp.remakeConstraints {
            closure($0, container.snp)
        }
    }

    func makeConstraintsWithContainer(_ container: UILayoutGuide, closure: (ConstraintMaker, ConstraintAttributesDSL) -> Void) {
        snp.makeConstraints {
            closure($0, container.snp)
        }
    }

    func remakeConstraintsWithContainer(_ container: UILayoutGuide, closure: (ConstraintMaker, ConstraintAttributesDSL) -> Void) {
        snp.remakeConstraints {
            closure($0, container.snp)
        }
    }

    func makeConstraintsWithView(_ view: UIView, closure: (ConstraintMaker, ConstraintViewDSL) -> Void) {
        snp.makeConstraints {
            closure($0, view.snp)
        }
    }

    func makeConstraintsWithViews(_ view1: UIView, _ view2: UIView, closure: (ConstraintMaker, ConstraintViewDSL, ConstraintViewDSL) -> Void) {
        snp.makeConstraints {
            closure($0, view1.snp, view2.snp)
        }
    }

    func remakeConstraintsWithViews(_ view1: UIView, _ view2: UIView, closure: (ConstraintMaker, ConstraintViewDSL, ConstraintViewDSL) -> Void) {
        snp.remakeConstraints {
            closure($0, view1.snp, view2.snp)
        }
    }

    func makeConstraintsWithViews(_ view1: UIView, _ container: UILayoutGuide, closure: (ConstraintMaker, ConstraintViewDSL, ConstraintAttributesDSL) -> Void) {
        snp.makeConstraints {
            closure($0, view1.snp, container.snp)
        }
    }
}



extension UIView {
    static var identifier: String {
        self.className
    }
}
