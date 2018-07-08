@testable import Reusable
import XCTest

class Reusable_Tests: XCTestCase {
    class TestClassReusable: Reusable {}
    struct TestStructReusable: Reusable {}
    class TestObjectReusable: NSObject, Reusable {}

    func testIdentifier() {
        XCTAssertEqual(TestClassReusable.reuseIdentifier, "TestClassReusable")
        XCTAssertEqual(TestStructReusable.reuseIdentifier, "TestStructReusable")
        XCTAssertEqual(TestObjectReusable.reuseIdentifier, "TestObjectReusable")
    }
}
