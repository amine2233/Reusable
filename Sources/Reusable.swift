//
//  File.swift
//  Reusable
//
//  Created by Amine Bensalah on 05/03/2018.
//

import Foundation

public protocol Reusable {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
