//
//  ViewController.swift
//  SwiftGrammerPractice
//
//  Created by Typoon on 2015. 1. 12..
//  Copyright (c) 2015년 apisdk. All rights reserved.
//

import Cocoa


class SquareView: NSView {
    override func drawRect(dirtyRect: NSRect) {
        NSColor.greenColor().setFill()
        NSRectFill(dirtyRect)
        
        super.drawRect(dirtyRect)
    }
}

class ViewController: NSViewController {

    var user: Person?
    var userCar: Car?
    
    var seller: Person?
    var sellerCar: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
 
        makeSquareView()
        
        testMemoryLeak()
        testClosureLeak()
        testUnownedTest()
    }

    func makeSquareView() {
        let viewFrame: CGRect = self.view.frame
        var width: Float = 100
        var height: Float = 50
        var positionX: Float = Float(viewFrame.size.width) / 2 - width
        var positionY: Float = Float(viewFrame.size.height) / 2 - height
        
        var mainView: SquareView = SquareView(frame: CGRectMake(CGFloat(width), CGFloat(height), CGFloat(positionX), CGFloat(positionY)))
        self.view.addSubview(mainView)
    }
    
    func testMemoryLeak() {
        user = Person(name: "User")
        userCar = Car(model: "userCar")
        
        seller = Person(name: "Seller")
        sellerCar = Car(model: "sellerCar")
        
        user?.car = userCar
        userCar?.leesee = user
        
        seller?.car = sellerCar
        sellerCar?.seller = seller
        
        userCar = nil
        user = nil
        
        seller = nil
        sellerCar = nil
    }
    
    func testUnownedTest() {
        var person: Person? = Person(name: "Peter")

        person?.fitnessMembership = Membership(owner: person!)

    }
    
    func testClosureLeak() {
        var myCar: Car? = Car(model: "tico")
        myCar!.drive(1300.0, usedGas: 73.0)
        let mileage: Double = myCar!.gasMileage()
        NSLog("%f", mileage)
        myCar = nil
    }
    
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

