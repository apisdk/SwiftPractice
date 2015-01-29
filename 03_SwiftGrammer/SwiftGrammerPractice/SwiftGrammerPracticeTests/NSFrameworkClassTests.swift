//
//  NSFrameworkClassTests.swift
//  SwiftGrammerPractice
//
//  Created by Typoon on 2015. 1. 28..
//  Copyright (c) 2015년 apisdk. All rights reserved.
//

import Cocoa
import XCTest

class NSFrameworkClassTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testGetClass() {
        // This is an example of a functional test case.
        
        let personClassObject = Person.self
        let strClassObject: AnyClass! = object_getClass(NSString)
        
        let tony: Person = Person(name: "tony")
        let helloText: String = String("Hello")
        
        XCTAssert(personClassObject.className() == tony.className, "class name is not equal")
    }
    
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
