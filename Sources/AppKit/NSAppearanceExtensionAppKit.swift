#if canImport(AppKit)
import AppKit

#if !os(watchOS)
extension NSAppearanceCustomization {
    @discardableResult
    public func style(_ styleClosure: (Self) -> Swift.Void) -> Self {
        styleClosure(self)
        return self
    }
}

#endif

#endif
