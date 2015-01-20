//
//  SwiftGrammerPracticeTests.swift
//  SwiftGrammerPracticeTests
//
//  Created by Typoon on 2015. 1. 12..
//  Copyright (c) 2015년 apisdk. All rights reserved.
//

import Cocoa
import XCTest


class SwiftGrammerPracticeTests: XCTestCase {
    
    var people: [Person] = []
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        var person: Person = Person(name:"TEST_PERSON")
        var ponyCar: Car = Car(model: "TEST_MODEL_NAME")
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
    
    func testStrongReference() {
        
        // initialized value of nil
        var reference1: Person?
        var reference2: Person?
        var reference3: Person?
        
        // strong reference
        reference1 = Person(name: "Tony")
        
        // strong reference
        reference2 = reference1
        reference3 = reference2
        
        // set nil
        reference1 = nil
        reference3 = nil
        reference3 = nil
    }
    
    func testReferenceCycleError() {
        var leesee: Person? = Person(name: "Bread")
        var car: Car? = Car(model: "Lightning")
        leesee?.car = car
        car?.leesee = leesee
        leesee = nil
        car = nil
        // does not call deinitialize method from Car, Person
    }
    
    func testWeakReference() {
        var seller: Person? = Person(name: "Bread")
        var car: Car? = Car(model: "Boogy")
        seller?.car = car
        car?.seller = seller
        seller = nil
        car = nil
        // does not call deinitialize method from Car, Person
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
    
    func testObjectCopy() {
        let person: Person = self.people.last!
        let car: Car = person.car!
        let carType: CarType = car.type
        
        var copiedCar: Car = car.copy() as Car
        copiedCar.type = .BIG
        
        XCTAssertTrue(carType != copiedCar.type, "carType is equal to origin type")
    }
    
    func testConvenienceInitialize()
    {
        var driver: BusDriver = BusDriver(name: "Tom", registration: "REG001")
        NSLog(driver.name)
        NSLog(driver.registration)
        XCTAssertNotNil(driver, "driver is nil")
    }

}
