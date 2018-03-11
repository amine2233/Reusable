import Foundation
import AppKit

public protocol ReusableController: Reusable { }

extension ReusableController {
    public static func create<T: NSViewController>(bundle nibBundle: Bundle? = nil) -> T {
        if let viewController = NSViewController(nibName: NSNib.Name(rawValue: Self.reuseIdentifier), bundle: nibBundle) as? T {
            return viewController
        }
        return T(nibName: nil, bundle: nibBundle)
    }
}
