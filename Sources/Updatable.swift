#if canImport(Foundation)
import Foundation

public protocol UpdatableProtocol {
    associatedtype ViewModel
    associatedtype Index

    var viewModel: ViewModel? { get }
    var indexPath: Index? { get }
}

public protocol Updatable: UpdatableProtocol {
    func update(with viewModel: ViewModel?, at indexPath: Index?)
}

public protocol UpdatableDelegate: UpdatableProtocol {
    associatedtype Delegate
    var delegate: Delegate? { get }

    func update(with viewModel: ViewModel?, at indexPath: Index?, delegate: Delegate?)
}

#endif
