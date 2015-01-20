//
//  ViewController.swift
//  SwiftGrammerPractice
//
//  Created by Typoon on 2015. 1. 12..
//  Copyright (c) 2015년 apisdk. All rights reserved.
//

import Cocoa



class Person : NSObject {
    var name: String!
    var car: Car?
    
    override init() {
        name = "unknown"
    }
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        println("Person(\(name)) is being deinitialized")
    }
}

class Car : NSObject{
    var model: String
    var leesee: Person?
    
    init(model: String) {
        self.model = model
    }
    
    deinit {
        println("Car(\(model)) is being deinitialized")
    }
    
    
}



class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func testRefence() {
        
        var str = "Hello, playground"
        
        
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
        
        reference2 = nil
        
        reference3 = nil
        // deinitialized Person
        
        var person: Person? = Person(name: "Jane")
        var pony: Car? = Car(model: "pony")
        
        person!.car = pony
        pony!.leesee = person
        
        // reference remain
        person = nil
        pony = nil

    }

}

