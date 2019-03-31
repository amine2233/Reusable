#if canImport(UIKit)
import UIKit

#if !os(watchOS)
public protocol ReusableCell: Reusable {
    static var nib: UINib? { get }
}

extension ReusableCell {
    public static var nib: UINib? {
        return UINib(nibName: Self.reuseIdentifier, bundle: nil)
    }
}

extension UITableView {
    public func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: ReusableCell {
        if let _nib = T.nib {
            register(_nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(_: T.Type, for indexPath: IndexPath) -> T? where T: ReusableCell {
        return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T
    }

    public func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) where T: ReusableCell {
        if let nib = T.nib {
            register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        } else {
            register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) -> T? where T: ReusableCell {
        return self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T
    }
}

extension UICollectionView {
    public func registerReusableCell<T: UICollectionViewCell>(_: T.Type) where T: ReusableCell {
        if let nib = T.nib {
            register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
        } else {
            register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
        }
    }

    public func dequeueReusableCell<T: UICollectionViewCell>(_: T.Type,for indexPath: IndexPath) -> T? where T: ReusableCell {
        return self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T
    }
    
    public func registerReusableSupplementaryView<T: UICollectionReusableView>(_: T.Type, elementKind: String) where T: ReusableCell {
        if let nib = T.nib {
            register(nib, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
        } else {
            register(T.self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    public func dequeueReusableSupplementaryView<T: UICollectionViewCell>(_: T.Type, elementKind: String, indexPath: IndexPath) -> T? where T: ReusableCell {
        return self.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T
    }
}

#endif

#endif
