@testable import Reusable
import XCTest

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

        func update(with vm: String?, at indexPath: IndexPath?) {
            viewModel = vm
            self.indexPath = indexPath
        }
    }

    func testExample() {
        let cell = Cell(viewModel: "value", indexPath: IndexPath(item: 0, section: 0))
        XCTAssertEqual(cell.viewModel, "value")
        XCTAssertEqual(cell.indexPath, IndexPath(item: 0, section: 0))

        cell.update(with: "newValue", at: IndexPath(item: 0, section: 2))

        XCTAssertEqual(cell.viewModel, "newValue")
        XCTAssertEqual(cell.indexPath, IndexPath(item: 0, section: 2))
    }
}
