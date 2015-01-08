//
//  MusicPlayerViewController.swift
//  PlaySound
//
//  Created by Typoon on 2014. 12. 26..
//  Copyright (c) 2014년 apisdk. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

protocol MediaPlayer: class {
    var audioPlayer: AVAudioPlayer! { get set }
    func nowPlayer() -> AVAudioPlayer
}


class MusicPlayerViewController : UIViewController, MediaPlayer
{
     var audioPlayer: AVAudioPlayer!
    
    func nowPlayer() -> AVAudioPlayer {
        return audioPlayer
    }
}