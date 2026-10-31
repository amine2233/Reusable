#if canImport(UIKit)
import UIKit

#if !os(watchOS)

protocol ResuableView: Reusable {
    static var nib: UINib? { get }
}

extension ResuableView where Self: UIView {
    static var nib: UINib? {
        return UINib(nibName: String(describing: Self.reuseIdentifier), bundle: nil)
    }
}

#endif

#endif
