//
//  ReusableStoryboard.swift
//  Reusable iOS
//
//  Created by Amine Bensalah on 06/03/2018.
//

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

/// Reusable Storyboard Protocol for manage your storyboard file
public protocol ReusableStoryboard: Reusable { }

public extension ReusableStoryboard {
    public static func storyboard() -> UIStoryboard {
        return UIStoryboard(name: self.reuseIdentifier, bundle: nil)
    }
    
    public static func initialViewController() -> UIViewController? {
        return storyboard().instantiateInitialViewController()
    }
    
    public static func instantiateController<T: UIViewController>(type: T.Type) -> T? {
        return storyboard().instantiateViewController(withIdentifier: String(describing: type)) as? T
    }
}

public extension ReusableStoryboard where Self: RawRepresentable, Self.RawValue == String {
    public func viewController() -> UIViewController {
        return Self.storyboard().instantiateViewController(withIdentifier: self.rawValue)
    }
    
    public static func viewController(identifier: Self) -> UIViewController {
        return identifier.viewController()
    }
}

protocol ReusableStoryboardSegueType: RawRepresentable { }

extension UIViewController {
    func performSegue<S: ReusableStoryboardSegueType>(segue: S, sender: AnyObject? = nil) where S.RawValue == String {
        performSegue(withIdentifier: segue.rawValue, sender: sender)
    }
}
