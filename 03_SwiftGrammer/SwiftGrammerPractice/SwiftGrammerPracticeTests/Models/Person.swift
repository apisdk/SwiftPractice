//
//  Person.swift
//  SwiftGrammerPractice
//
//  Created by Typoon on 2015. 1. 20..
//  Copyright (c) 2015년 apisdk. All rights reserved.
//

import Foundation

class Person : NSObject {
    var name: String!
    var car: Car?
    var fitnessMembership: Membership?
    
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
