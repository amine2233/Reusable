//
//  UpdatableTests.swift
//  Reusable
//
//  Created by Amine Bensalah on 05/03/2018.
//

import XCTest
@testable import Reusable

class UpdatableTests: XCTestCase {

    class Cell: Updatable {
        typealias ViewModel = String
        typealias Index = IndexPath
        
        var viewModel: String?
        var indexPath: IndexPath?
        
        init(viewModel: String, indexPath: IndexPath?) {
            self.viewModel = viewModel
            self.indexPath = indexPath
        }
        
        func update(viewModel vm: String?, at indexPath: IndexPath?) {
            self.viewModel = vm
            self.indexPath = indexPath
        }
    }
    
    func testExample() {
        let cell = Cell(viewModel: "value", indexPath: IndexPath(item: 0, section: 0))
        XCTAssertEqual(cell.viewModel, "value")
        XCTAssertEqual(cell.indexPath, IndexPath(item: 0, section: 0))

        cell.update(viewModel: "newValue", at: IndexPath(item: 0, section: 2))
        
        XCTAssertEqual(cell.viewModel, "newValue")
        XCTAssertEqual(cell.indexPath, IndexPath(item: 0, section: 2))
    }
}
