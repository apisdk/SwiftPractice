//
//  Car.swift
//  SwiftGrammerPractice
//
//  Created by Typoon on 2015. 1. 20..
//  Copyright (c) 2015년 apisdk. All rights reserved.
//

import Foundation

class Car : NSObject {
    var model: String
    var leesee: Person?
    weak var seller: Person?
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
    
    override func copy() -> AnyObject {
        var newCar: Car = Car(model:self.model)
        newCar.type = self.type
        return newCar
    }
    
}
