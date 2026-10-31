#if canImport(UIKit)
import UIKit

#if !os(watchOS)
public protocol ReusableController: Reusable {
}

extension ReusableController where Self: UIViewController {
    public static func create<T: UIViewController>(bundle nibBundle: Bundle? = nil) -> T {
        if let viewController = UIViewController(nibName: Self.reuseIdentifier, bundle: nibBundle) as? T {
            return viewController
        }
        return T(nibName: nil, bundle: nibBundle)
    }
}

#endif

#endif
