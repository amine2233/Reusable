#if canImport(AppKit)
import AppKit

#if !os(watchOS)
public protocol ReusableController: Reusable {}

extension ReusableController where Self: NSViewController {
    public static func create<T: NSViewController>(bundle nibBundle: Bundle? = nil) -> T {
        if let viewController = NSViewController(nibName: Self.reuseIdentifier, bundle: nibBundle) as? T {
            return viewController
        }
        return T(nibName: nil, bundle: nibBundle)
    }
}
#endif

#endif
