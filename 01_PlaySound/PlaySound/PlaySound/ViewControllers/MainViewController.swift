//
//  MainViewController.swift
//  PlaySound
//
//  Created by Typoon on 2014. 12. 19..
//  Copyright (c) 2014년 apisdk. All rights reserved.
//

import UIKit
import AVFoundation

let kSampleFileName = "sample-160"

class MainViewController: UIViewController, AVAudioPlayerDelegate
{
    var audioPlayer: AVAudioPlayer?
    var progressTimer: NSTimer?
    
    @IBOutlet var progressSlider:UISlider!
    @IBOutlet var volumeStepper:UIStepper!
    @IBOutlet var volumeLabel:UILabel!
    
    
    @IBAction func willPlayAudio(button: UIButton)
    {
        self.audioPlayer!.play()
    }
    
    @IBAction func willStopAudio(button: UIButton)
    {
        self.audioPlayer!.stop()
    }
    
    override func viewDidLoad() {
        // get URL for mp3 file
        // free license sample from : http://sampleswap.org/viewtopic.php?t=2450
        var bundleURL: NSURL = NSBundle.mainBundle().URLForResource(kSampleFileName, withExtension: "mp3")!
        
        // init player
        self.audioPlayer = AVAudioPlayer(contentsOfURL: bundleURL, error: nil)
        
        self.audioPlayer!.delegate = self
        //self.progressSlider!.value = 0
        
        let currentVolume = Float(self.volumeStepper.value)
        setVolumeLabel(currentVolume)
        super.viewDidLoad()
    }
    
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer!, error: NSError!) {
        // if error occur, will show alertView about that.
        let alert: UIAlertView = UIAlertView(title: "error",
            message: "Error occured :: \(error.code) \(error.description)",
            delegate: nil,
            cancelButtonTitle: "Confirm")
        alert.show()
        
    }
    
    @IBAction func changeVolumeStepper(stepper: UIStepper)
    {
        let currentVolume = Float(stepper.value)
        self.audioPlayer!.volume = currentVolume
        setVolumeLabel(currentVolume)
    }
    
    func setVolumeLabel(volumeValue :Float)
    {
        self.volumeLabel!.text = NSString(format:  "%.1f", volumeValue)
    }
}

