//
//  ViewController.swift
//  Eight Notes
//
//  Created by mini03 on 9/4/19.
//  Copyright © 2019 TeamLuna. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var arrNoteNameFile: [String] = ["note1","note2","note3","note4","note5","note6","note7"]
    var notePlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onPlayPiano(_  sender : UIButton) {
        print(sender.tag)
        if (notePlayer?.isPlaying == true){
            notePlayer?.stop()
        }
    
        playNote(forResource: arrNoteNameFile[sender.tag])
    }
    
    func playNote(forResource:String!,ofType:String = "wav"){
        print(forResource!)
        let noteUrl = Bundle.main.path(forResource: forResource, ofType: ofType)
        do {
            try notePlayer = AVAudioPlayer(contentsOf:URL(fileURLWithPath: noteUrl!) )
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: [AVAudioSession.CategoryOptions.mixWithOthers])
            print("play note DONE")
        } catch  {
             print("play note ERROR")
        }
        notePlayer?.prepareToPlay()
        notePlayer?.play()
    }
    
}

