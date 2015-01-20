//
//  CarType.swift
//  SwiftGrammerPractice
//
//  Created by Typoon on 2015. 1. 20..
//  Copyright (c) 2015년 apisdk. All rights reserved.
//

import Foundation

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