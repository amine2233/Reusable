#if canImport(AppKit)
import AppKit

#if !os(watchOS)
public protocol ReusableCell: Reusable {}

public extension ReusableCell {
    static var nib: NSNib? {
        return NSNib(nibNamed: Self.reuseIdentifier, bundle: nil)
    }
}

extension NSTableView {
    public func registerReusableCell<T: NSTableCellView>(_: T.Type) where T: ReusableCell {
        register(T.nib, forIdentifier: NSUserInterfaceItemIdentifier(rawValue: T.reuseIdentifier))
    }
}

extension NSCollectionView {
    public func registerReusableCell<T: NSCollectionViewItem>(_: T.Type) where T: ReusableCell {
        if let nib = T.nib {
            register(nib, forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: T.reuseIdentifier))
        } else {
            register(T.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: T.reuseIdentifier))
        }
    }

    public func makeItemWithIdentifierReusableCell<T: NSCollectionViewItem>(_: T.Type, indexPath: IndexPath) -> T? where T: ReusableCell {
        return makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: T.reuseIdentifier), for: indexPath) as? T
    }
}
#endif

#endif
