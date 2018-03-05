//
//  ReusableController.swift
//  Reusable iOS
//
//  Created by Amine Bensalah on 05/03/2018.
//

import Foundation
import UIKit

public protocol ReusableController: Reusable { }

public extension UIViewController {
	public static func create<T: ReusableController>(_: T.Type, bundle nibBundle: Bundle? = nil) -> T {
		return UIViewController(nibName: T.reuseIdentifier, bundle: nibBundle) as! T
	}
}
