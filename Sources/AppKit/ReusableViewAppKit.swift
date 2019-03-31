#if canImport(AppKit)
import AppKit

#if !os(watchOS)
public protocol ReusableView: Reusable {}

extension ReusableView {
    public static var nib: NSNib? {
        return NSNib(nibNamed: Self.reuseIdentifier, bundle: nil)
    }
}

#endif

#endif
