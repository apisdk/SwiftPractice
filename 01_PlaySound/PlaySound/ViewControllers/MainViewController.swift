//
//  MainViewController.swift
//  PlaySound
//
//  Created by Typoon on 2014. 12. 19..
//  Copyright (c) 2014년 apisdk. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController, AVAudioPlayerDelegate
{
    var audioPlayer: AVAudioPlayer?
    var progressTimer: NSTimer?
    
    @IBOutlet var progressSlider:UISlider!
    @IBOutlet var volumeSlider:UISlider!
    @IBOutlet var volumeLabel:UILabel!
    
    override func viewDidLoad() {
        // get URL for mp3 file
        var bundleURL: NSURL = NSBundle.mainBundle().URLForResource("sound", withExtension: "mp3")!
        
        // init player
        self.audioPlayer = AVAudioPlayer(contentsOfURL: bundleURL, error: nil)
        
        self.audioPlayer!.delegate = self
        self.progressSlider!.value = 0
        
        super.viewDidLoad()
    }
}

