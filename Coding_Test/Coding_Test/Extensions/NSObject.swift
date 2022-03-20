//
//  NSObject.swift
//  Coding_Test
//
//  Created by Vinod on 20/03/22.
//

import Foundation

extension NSObject {

    var className: String { return String(describing: type(of: self)) }

    class var className: String { return String(describing: self) }
}
