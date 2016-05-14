//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Afrizal Fikri on 5/14/16.
//  Copyright © 2016 Afrizal Fikri. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var dvButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: NSURL!
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum ButtonType: Int { case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }
    
    @IBAction func playSoundForButton(sender: AnyObject) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .Slow :
            playSound(rate: 0.5)
        case .Fast :
            playSound(rate: 1.5)
        case .Chipmunk :
            playSound(pitch: 1000)
        case .Vader :
            playSound(pitch: -1000)
        case .Echo :
            playSound(echo: true)
        case .Reverb :
            playSound(reverb: true)
        }
        
        configureUI(.Playing)
        
    }

    @IBAction func stopButtonPressed(sender: AnyObject) {
        stopAudio()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
