//
//  Updatable.swift
//  Reusable
//
//  Created by Amine Bensalah on 05/03/2018.
//

import Foundation

public protocol UpdatableProtocol {
    
    associatedtype ViewModel
    associatedtype Index
    
    var viewModel: ViewModel? { get }
    var indexPath: Index? { get }
}

public protocol Updatable: UpdatableProtocol {
    func update(viewModel vm: ViewModel?, at indexPath: Index?)
}

public protocol UpdatableAction: UpdatableProtocol {
    associatedtype Delegate
    var delegate: Delegate? { get }

    func update(viewModel vm: ViewModel?, at indexPath: Index?, delegate: Delegate?)
}
