//
//  ReusableView.swift
//  Reusable
//
//  Created by Amine Bensalah on 06/03/2018.
//

import UIKit

public protocol ReusableView: Reusable {
    static var nib: UINib? { get }
}

public extension ReusableView {
    static var nib: UINib? { return nil }
}

public extension UIView {
    public static func reuseInstantiate<T: ReusableView>(_: T.Type, withOwner: Any? = nil, options: [AnyHashable: Any]? = nil) -> T? {
        guard let instantiate = T.nib?.instantiate(withOwner: withOwner, options: options), !instantiate.isEmpty else {
            return nil
        }
        return instantiate.first as? T
    }
}
