//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var EggProgressBar: UIProgressView!
    @IBOutlet weak var TextViewEggs: UILabel!
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer?
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        EggProgressBar.progress = 0.0
        secondsPassed = 0
        
        let hardness = sender.currentTitle!
        TextViewEggs.text = hardness
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime{
            
            secondsPassed += 1
            
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            
            EggProgressBar.progress = percentageProgress
        
            
        }else{
            timer.invalidate()
            TextViewEggs.text = "DONE!"
            alarm()
        }
    }
    
    
    func alarm() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
        
    }}
