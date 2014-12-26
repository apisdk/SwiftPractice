//
//  ViewControllerTests.swift
//  PlaySound
//
//  Created by Typoon on 2014. 12. 22..
//  Copyright (c) 2014년 apisdk. All rights reserved.
//

import UIKit
import XCTest

class ViewControllerTests: XCTestCase {
    
    var mainViewController: UIViewController?

    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        self.mainViewController = storyboard.instantiateViewControllerWithIdentifier("Main") as? UIViewController
        
        XCTAssertNotNil(self.mainViewController, "MainViewController nil.")

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testViewDidLoad() {
        // This is an example of a functional test case.
        println("check loaded view")
        XCTAssertNotNil(self.mainViewController, "ViewController not nil")
        XCTAssertNotNil(self.mainViewController!.view, "view did not load")
    }
}
