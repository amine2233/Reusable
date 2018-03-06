//
//  Reusable.swift
//  Instapaperable
//
//  Created by Amine Bensalah on 24/07/2017.
//  Copyright © 2017 Amine Bensalah. All rights reserved.
//

import Foundation
import Cocoa

public protocol ReusableCell: Reusable { }

public extension ReusableCell {
    static var nib: NSNib? { return nil }
}

public extension NSTableView {
    public func registerReusableCell<T: NSTableCellView>(_: T.Type) where T: ReusableCell {
        self.register(T.nib, forIdentifier: NSUserInterfaceItemIdentifier(rawValue: T.reuseIdentifier))
    }
}

public extension NSCollectionView {
    public func registerReusableCell<T: NSCollectionViewItem>(_: T.Type) where T: ReusableCell {
        if let nib = T.nib {
            self.register(nib, forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: T.reuseIdentifier))
        } else {
            self.register(T.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: T.reuseIdentifier))
        }
    }

    public func makeItemWithIdentifierReusableCell<T: NSCollectionViewItem>(_: T.Type, indexPath: IndexPath) -> T? where T: ReusableCell {
        return self.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: T.reuseIdentifier), for: indexPath) as? T
    }
}
