//
//  PlaySoundViewController.swift
//  perfect peech
//
//  Created by Yves Songolo on 9/3/17.
//  Copyright © 2017 YDras. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {

    var recordedAudioURL : URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var speedButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reversButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    enum ButtonType: Int {
        case slow = 0,speed,hightPeech,lowPeech,echo,reverse
    }
    
    
    /// function to setup the buttons view to fit instead of stretching
    func avoidButtonStregtch(){
        self.slowButton.contentMode = .center
        self.slowButton.imageView?.contentMode = .scaleAspectFit
        
        self.speedButton.contentMode = .center
        self.speedButton.imageView?.contentMode = .scaleAspectFit
        
        self.highPitchButton.contentMode = .center
        self.highPitchButton.imageView?.contentMode = .scaleAspectFit
        
        self.lowPitchButton.contentMode = .center
        self.lowPitchButton.imageView?.contentMode = .scaleAspectFit
        
        self.echoButton.contentMode = .center
        self.echoButton.imageView?.contentMode = .scaleAspectFit
        
        self.reversButton.contentMode = .center
        self.reversButton.imageView?.contentMode = .scaleAspectFit
        
        self.stopButton.contentMode = .center
        self.stopButton.imageView?.contentMode = .scaleAspectFit
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton){
       
        switch(ButtonType(rawValue: sender.tag)!){
        case .slow: playSound(rate: 0.5)
        case .speed: playSound(rate: 1.5)
        case .hightPeech: playSound(pitch: 1000)
        case .lowPeech: playSound(pitch: -1000)
        case .echo: playSound(echo: true)
        case .reverse: playSound( reverb: true)
        }
        
        configureUI(.playing)
        
    }
    @IBAction func stopPlaying(_ sender: UIButton){
    stopAudio()
    }
    
     override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.avoidButtonStregtch()
        
        configureUI(.notPlaying)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAudio()
      
    }
}


















