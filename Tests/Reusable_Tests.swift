//
//  Reusable_iOSTests.swift
//  Reusable iOSTests
//
//  Created by Amine Bensalah on 05/03/2018.
//

import XCTest
@testable import Reusable

class Reusable_Tests: XCTestCase {
    
    class TestClassReusable: Reusable { }
    struct TestStructReusable: Reusable { }
    class TestObjectReusable: NSObject, Reusable { }

    func testIdentifier() {
        XCTAssertEqual(TestClassReusable.reuseIdentifier, "TestClassReusable")
        XCTAssertEqual(TestStructReusable.reuseIdentifier, "TestStructReusable")
        XCTAssertEqual(TestObjectReusable.reuseIdentifier, "TestObjectReusable")
    }
}
