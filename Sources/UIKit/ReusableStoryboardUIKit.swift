#if canImport(UIKit)
import UIKit

/*
 Exemple for use ReusableStoryboard

 struct StoryboardScene {
 enum MainStoryboard: String, ReusableStoryboard {
 static let storyboardName: String = "Main"

 case moduleViewController = "ModuleViewController"

 static func instantiateModuleViewController() -> ModuleViewController {
 guard let vc = StoryboardScene.MainStoryboard.moduleViewController.viewController() as? ModuleViewController else {
 fatalError("Error")
 }
 return vc
 }
 }
 }

 */
#if !os(watchOS)
/// Reusable Storyboard Protocol for manage your storyboard file
public protocol ReusableStoryboard: Reusable {}

extension ReusableStoryboard {
    public static func storyboard() -> UIStoryboard {
        return UIStoryboard(name: reuseIdentifier, bundle: nil)
    }

    public static func initialViewController() -> UIViewController? {
        return storyboard().instantiateInitialViewController()
    }
    
    public static func instantiateController<T: UIViewController>(_: T.Type) -> T? {
        return storyboard().instantiateViewController(withIdentifier: String(describing: T.self)) as? T
    }
}

extension ReusableStoryboard where Self: RawRepresentable, Self.RawValue == String {
    public func viewController() -> UIViewController {
        return Self.storyboard().instantiateViewController(withIdentifier: rawValue)
    }

    public static func viewController(identifier: Self) -> UIViewController {
        return identifier.viewController()
    }
}

protocol ReusableStoryboardSegueType: RawRepresentable {}

extension UIViewController {
    func performSegue<S: ReusableStoryboardSegueType>(segue: S, sender: AnyObject? = nil) where S.RawValue == String {
        performSegue(withIdentifier: segue.rawValue, sender: sender)
    }
}

#endif

#endif
