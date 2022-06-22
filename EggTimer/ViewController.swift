//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var EggProgressBar: UIProgressView!
    @IBOutlet weak var TextViewEggs: UILabel!
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
    
        timer.invalidate()
        
        TextViewEggs.text = "How do you like your eggs?"
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime{
            
            let percentageProgress = secondsPassed / totalTime
            
            EggProgressBar.progress = Float(percentageProgress)
        
            secondsPassed += 1
        }else{
            timer.invalidate()
            TextViewEggs.text = "DONE!"
        }
    }
}
