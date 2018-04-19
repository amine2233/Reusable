//
//  UIAppearance.swift
//  Reusable iOS
//
//  Created by Amine Bensalah on 19/04/2018.
//

import UIKit

extension UIAppearance {
    @discardableResult
    public func style(_ styleClosure: (Self) -> Swift.Void) -> Self {
        styleClosure(self)
        return self
    }
}
