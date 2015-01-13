//
//  SwiftGrammerPracticeTests.swift
//  SwiftGrammerPracticeTests
//
//  Created by Typoon on 2015. 1. 12..
//  Copyright (c) 2015년 apisdk. All rights reserved.
//

import Cocoa
import XCTest

class Person : NSObject {
    var name: String!
    var car: Car?
    
    override init() {
        name = "John"
    }
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        println("Person(\(name)) is being deinitialized")
    }
}

enum CarType: Int, Printable  {
    case BIG = 0
    case MIDDLE
    case SMALL
    case NONE
    
    var description: String {
        get {
            return self.stringValue()
        }
    }
    
    private func stringValue() -> String {
        var result: String!
        
        switch self {
        case BIG:
            result = "BIG"
        case MIDDLE:
            result = "MIDDLE"
        case SMALL:
            result = "SMALL"
        default:
            result = "NONE"
        }
        
        return result
    }

}

class Car : NSObject {
    var model: String
    var leesee: Person?
    var type: CarType
    
    init(model: String) {
        self.model = model
        self.type = CarType.NONE
    }
    
    init(model: String, type: CarType) {
        self.model = model
        self.type = type
    }
    
    deinit {
        println("Car(\(model)) is being deinitialized")
    }
}

class SwiftGrammerPracticeTests: XCTestCase {
    
    var people: [Person] = []
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        var person: Person = Person()
        var ponyCar: Car = Car(model: "Pony")
        ponyCar.type = CarType.SMALL
        person.car = ponyCar
        
        XCTAssertNotNil(person, "person is nil")
        XCTAssertNotNil(person.car, "person's car is nil")
        people.append(person)
    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        people.removeAll(keepCapacity: true)
    }
    
    func testRetainCount() {
        // This is an example of a functional test case.
        

    }

    func testDescriptionOfEnum() {
        
        for person in self.people {
            let car: Car = person.car!
            NSLog(car.type.description)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
