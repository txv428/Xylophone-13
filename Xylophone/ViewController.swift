//
//  ViewController.swift
//  Xylophone
//
//  Created by Apple on 26/03/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func notePressed(_ sender: UIButton) {
        sender.alpha = 0.5
        playSound(sound: sender.currentTitle!)
                    
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            sender.alpha = 1
        }
    }
    
    var player: AVAudioPlayer?

    func playSound(sound: String) {
        let url = Bundle.main.url(forResource: sound, withExtension: "wav", subdirectory: "Sounds")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
    }
}

