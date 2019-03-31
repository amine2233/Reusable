#if canImport(AppKit)
import AppKit

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
    public static func storyboard() -> NSStoryboard {
        return NSStoryboard(name: reuseIdentifier, bundle: nil)
    }

    public static func initialViewController<T: NSViewController>() -> T? {
        return storyboard().instantiateInitialController() as? T
    }

    public static func instantiateController<T: NSViewController>(type: T.Type) -> T? {
        return storyboard().instantiateController(withIdentifier: String(describing: type)) as? T
    }
}

extension ReusableStoryboard where Self: RawRepresentable, Self.RawValue == String {
    public func viewController() -> Any {
        return Self.storyboard().instantiateController(withIdentifier: rawValue)
    }

    public static func viewController(identifier: Self) -> Any {
        return identifier.viewController()
    }
}

protocol ReusableStoryboardSegueType: RawRepresentable {}

extension NSViewController {
    func performSegue<S: ReusableStoryboardSegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
        performSegue(withIdentifier: segue.rawValue, sender: sender)
    }
}

#endif

#endif
