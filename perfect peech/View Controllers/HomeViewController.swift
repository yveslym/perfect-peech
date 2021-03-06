//
//  HomeViewController.swift
//  perfect peech
//
//  Created by Yves Songolo on 9/3/17.
//  Copyright © 2017 YDras. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var TapToRecordLabel: UILabel!
    
    var audioRecord : AVAudioRecorder!
    
    
    /// fuction to record user voice
    /// when user press the record button
    /// - Parameter sender: Any is the sender parameter
    @IBAction func recordButtonTapped(_ sender: Any) {
        
       
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        let recordingName = "recordedVoice.wav"
        
        let pathArray = [dirPath,recordingName]
        
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        
        
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! self.audioRecord = AVAudioRecorder(url: filePath!, settings: [:])
        self.audioRecord.delegate = self
        self.audioRecord.isMeteringEnabled = true
        self.audioRecord.prepareToRecord()
        self.audioRecord.record()
         self.configureUI(isRecording: self.audioRecord.isRecording)
    }
    
    /// function to stop recording when user tap the
    /// stop button
    /// - Parameter sender: any is the sender parameter
    @IBAction func stopButtonTapped(_ sender: Any) {
        
        self.configureUI(isRecording: self.audioRecord.isRecording)
        self.audioRecord.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "record"{
            
            let playsoundvc = segue.destination as! PlaySoundViewController
            let recordedAudioURL = sender as! URL
            playsoundvc.recordedAudioURL = recordedAudioURL
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        
        if flag{
            self.performSegue(withIdentifier: "record", sender: self.audioRecord.url)
        }
        else{
            print("failed")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    self.configureUI(isRecording: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    /// function to configure the UI when recording and when not recording
    func configureUI( isRecording: Bool){
        if isRecording{
         
            self.TapToRecordLabel.text = " Recording..."
            self.recordButton.isEnabled = false
            self.stopButton.isEnabled = true

        }
        else{
            self.recordButton.isEnabled = true
            self.stopButton.isEnabled = false
            self.TapToRecordLabel.text = "Tap To Record"
        }
    }

}











