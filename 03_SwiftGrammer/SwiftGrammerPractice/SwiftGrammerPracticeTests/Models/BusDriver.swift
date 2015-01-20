//
//  BusDriver.swift
//  SwiftGrammerPractice
//
//  Created by Typoon on 2015. 1. 20..
//  Copyright (c) 2015년 apisdk. All rights reserved.
//

import Foundation

class BusDriver : Person {
    var registration: String!
    
    override init() {
        super.init()
    }
    
    init(name: String, registration: String) {
        super.init(name: name)
        self.registration = registration
    }
    
    override convenience init(name: String) {
        self.init(name:name, registration:"")
    }
    
}
