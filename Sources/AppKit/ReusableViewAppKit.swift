#if canImport(AppKit)
import AppKit

#if !os(watchOS)
public protocol ReusableView: Reusable {}

public extension ReusableView {
    static var nib: NSNib? {
        return NSNib(nibNamed: NSNib.Name(rawValue: Self.reuseIdentifier), bundle: nil)
    }
}

#endif

#endif
