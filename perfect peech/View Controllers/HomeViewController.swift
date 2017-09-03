//
//  HomeViewController.swift
//  perfect peech
//
//  Created by Yves Songolo on 9/3/17.
//  Copyright © 2017 YDras. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var TapToRecordLabel: UILabel!
    
    
    
    /// fuction to record user voice
    /// when user press the record button
    /// - Parameter sender: Any is the sender parameter
    @IBAction func recordButtonTapped(_ sender: Any) {
        
        self.recordButton.isEnabled = false
        self.stopButton.isEnabled = true
    }
    
    /// function to stop recording when user tap the
    /// stop button
    /// - Parameter sender: any is the sender parameter
    @IBAction func stopButtonTapped(_ sender: Any) {
        self.recordButton.isEnabled = true
        self.stopButton.isEnabled = false
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
