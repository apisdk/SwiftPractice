//
//  MainViewController.swift
//  PlaySound
//
//  Created by Typoon on 2014. 12. 19..
//  Copyright (c) 2014년 apisdk. All rights reserved.
//

import UIKit
import AVFoundation

let kSampleSoundFileName = "sample-160"
let kProgressLabelTextFormat = "%.0f %%"
let kCancelButtonTitle = "Confirm"

class MainViewController: MusicPlayerViewController, AVAudioPlayerDelegate
{
    var progressTimer: NSTimer?
    
    @IBOutlet var progressSlider:UISlider!
    @IBOutlet var volumeStepper:UIStepper!
    @IBOutlet var volumeLabel:UILabel!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var progressLabel: UILabel!
    @IBOutlet var playedTimeLabel: UILabel!
    
    // MARK: - UIViewController override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load player
        loadPlayer()
        
        // set volumeStepper
        volumeStepper.value = 0.1
        
        // set progressSlider
        progressSlider!.value = 0
        progressSlider.addTarget(self,
            action: Selector("progressSliderDidTouchUpInside"),
            forControlEvents: UIControlEvents.TouchUpInside)
        
        // update UI
        updateProgressLabel()
        updateVolumeLabel()
        updatePlayedTimeLabel()
    }
    
    // MARK: - initialize methods
    
    func loadPlayer()
    {
        // get URL for mp3 file
        // free license sample from : http://sampleswap.org/viewtopic.php?t=2450
        var soundFileURL: NSURL = NSBundle.mainBundle().URLForResource(kSampleSoundFileName, withExtension: "mp3")!

        audioPlayer = AVAudioPlayer(contentsOfURL: soundFileURL, error: nil)
        audioPlayer!.delegate = self
        audioPlayer.volume = 0.1
    }
    
    // MARK: - button delegate methods

    @IBAction func playButtonDidTouchUpInside(button: UIButton)
    {
        audioPlayer!.play()
        makeProgressTimer()
    }
    
    @IBAction func stopButtonDidTouchUpInside(button: UIButton)
    {
        invalidateProgressTimer()
        audioPlayer!.stop()
        
    }
 
    // MARK: - VolumeStepper action
    
    @IBAction func volumeStepperDidChanged(stepper: UIStepper)
    {
        let currentVolume = Float(stepper.value)
        audioPlayer!.volume = currentVolume
        setVolumeLabel(currentVolume)
    }

    // MARK: - update UI methods
    
    func updateVolumeLabel()
    {
        let currentVolume = Float(volumeStepper.value)
        setVolumeLabel(currentVolume)
    }
    
    func setVolumeLabel(volumeValue :Float)
    {
        volumeLabel!.text = NSString(format:  "%.1f", volumeValue)
    }
    
    private func updateProgressLabel()
    {
        let progressPercentValue = NSString(format: kProgressLabelTextFormat, progressSlider.value * 100)
        progressLabel!.text = progressPercentValue
    }
    
    private func updatePlayedTimeLabel()
    {
        func playTimeLabelText(currentTimeValue: Float) -> NSAttributedString {
            let currentTimeFontSize: CGFloat = 18.0
            let timeUnitFontSize: CGFloat = 12.0
            
            func currentTimeString(timeString: Float) -> NSAttributedString {
                let currentTimeString: String = String(format: "%.0f", timeString)
                let stringAttribute: NSDictionary = [NSFontAttributeName : UIFont.systemFontOfSize(currentTimeFontSize), NSForegroundColorAttributeName : UIColor.redColor()]
                let result: NSAttributedString = NSAttributedString(string: currentTimeString, attributes: stringAttribute)
                return result
            }
            
            func timeUnitString() -> NSAttributedString {
                let stringAttribute: NSDictionary = [NSFontAttributeName : UIFont.systemFontOfSize(timeUnitFontSize), NSForegroundColorAttributeName : UIColor.greenColor()]
                let result: NSAttributedString = NSAttributedString(string: " sec", attributes: stringAttribute)
                return result
            }

            let playTimelabelText: NSMutableAttributedString = NSMutableAttributedString()
            playTimelabelText.appendAttributedString(currentTimeString(currentTimeValue))
            playTimelabelText.appendAttributedString(timeUnitString())
            
            return playTimelabelText
        }
        
        let currentTimeValue = CFloat(audioPlayer!.currentTime)
        
        playedTimeLabel.attributedText = playTimeLabelText(currentTimeValue)
    }
    
    // MARK: - progressTimer
    
    func makeProgressTimer()
    {
        progressTimer = NSTimer.scheduledTimerWithTimeInterval(0.1,
            target: self,
            selector: Selector("progressTimerDidChangedInterval"),
            userInfo: nil,
            repeats: true)
    }
    
    func invalidateProgressTimer()
    {
        if (progressTimer == nil) {
            return
        }
        
        progressTimer!.invalidate()
        progressTimer = nil
    }
    
    func progressTimerDidChangedInterval()
    {
        if (progressSlider.touchInside) {
            return
        }
        
        progressSlider!.value = CFloat(audioPlayer!.currentTime / audioPlayer!.duration)
        updateProgressLabel()
        updatePlayedTimeLabel()
    }

    // MARK: - progressSlider
    
    func progressSliderDidTouchUpInside()
    {
        let resume: Bool = audioPlayer.playing
        
        invalidateProgressTimer()

        audioPlayer.stop()
        audioPlayer.currentTime = NSTimeInterval(CFloat(audioPlayer.duration) * progressSlider.value)
        audioPlayer.prepareToPlay()
        if (resume) {
            audioPlayer.play()
        }
        makeProgressTimer()
        updateProgressLabel()
    }
    
    // MARK : - audioPlayer delegate mehtods
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        invalidateProgressTimer()
    }
    
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer!, error: NSError!) {
        // if error occur, will show alertView about that.
        let alert: UIAlertView = UIAlertView(title: "error",
            message: "Error occured :: \(error.code) \(error.description)",
            delegate: nil,
            cancelButtonTitle: kCancelButtonTitle)
        alert.show()
        
    }
}

