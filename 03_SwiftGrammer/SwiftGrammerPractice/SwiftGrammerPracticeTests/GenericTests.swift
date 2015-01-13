//
//  GenericTests.swift
//  SwiftGrammerPractice
//
//  Created by Typoon on 2015. 1. 13..
//  Copyright (c) 2015년 apisdk. All rights reserved.
//

import Cocoa
import XCTest

class GenericTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func isEqualModel(a: String, b: String) -> Bool {
        return a == b
    }
    
    func isEqualType(a: Int, b: Int) -> Bool {
        return a == b
    }
    
    func isEqualValues<T: Equatable>(a: T, b: T) -> Bool {
        return a == b
    }

    func testUsingGenerics () {
        
        XCTAssertTrue(isEqualType(100, b: 100), "result is not equal")
        XCTAssertTrue(isEqualValues(1, b: 1), "result is false")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
