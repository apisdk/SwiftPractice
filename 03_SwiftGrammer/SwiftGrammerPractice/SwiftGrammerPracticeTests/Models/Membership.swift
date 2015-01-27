//
//  Membership.swift
//  SwiftGrammerPractice
//
//  Created by Typoon on 2015. 1. 27..
//  Copyright (c) 2015년 apisdk. All rights reserved.
//

import Foundation

class Membership {
    let membershipId: String
    weak var owner: Person?
    
    init(owner: Person) {
        self.owner = owner
        self.membershipId = "2014001"
    }
    
    deinit {
        println("\(membershipId) membership is being deinitialized")
    }
}