//
//  ViewControllerTests.swift
//  PlaySound
//
//  Created by Typoon on 2014. 12. 22..
//  Copyright (c) 2014년 apisdk. All rights reserved.
//

import UIKit
import XCTest
import AVFoundation


class ViewControllerTests: XCTestCase {
    
    var mainViewController: UIViewController!

    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.mainViewController = topViewController()
        
//        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        var mainVc: AnyObject = storyboard.instantiateViewControllerWithIdentifier("Main") as AnyObject
//        self.mainViewController = mainVc as UIViewController
//
        
        XCTAssertNotNil(self.mainViewController, "MainViewController nil.")
        XCTAssertNotNil(self.mainViewController!.view, "view did not load")
        

    }
    
    func topViewController() -> UIViewController
    {
        var windowss: NSArray = UIApplication.sharedApplication().windows
        var window: UIWindow = windowss[0] as UIWindow
        
        return window.rootViewController! as UIViewController
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
    
    func testInitAudioPlayer() {
        var audioPlayer:AVAudioPlayer!
        var mv: MusicPlayer!
        if (self.mainViewController!.respondsToSelector(Selector("audioPlayer"))) {

            var audioPlayer:AVAudioPlayer = self.mainViewController.valueForKey("audioPlayer")! as AVAudioPlayer
            XCTAssertNotNil(audioPlayer, "audioPlayer is nil")
        }
        
    }
}
