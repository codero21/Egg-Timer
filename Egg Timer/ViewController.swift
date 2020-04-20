//
//  ViewController.swift
//  Egg Timer
//
//  Created by Rollin Francois on 4/16/20.
//  Copyright © 2020 Francois Technology. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
       
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
//    time in seconds
    let eggTime = ["Soft": 3, "Medium": 4, "Hard": 5]
    
//    instance of AudioPlayer
    var player: AVAudioPlayer!
    
//    instance of timer object
    var timer = Timer()
    
//    total time elapsed
    var totalTime = 0
    
//    total time passed
    var secondsPassed = 0
    

    
    
    
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
              
//        reset timer each time button is pressed
        timer.invalidate()
        
//        print title of buttone pressed to the console
        print(sender.currentTitle!)
        
//        create constant for title of sender/button
        let hardness = sender.currentTitle!
        
//        set timer based on button pressed
        totalTime = eggTime[hardness]!
        
//        set progress bar back to 0
        progressBar.progress = 0.0
        
//        reset secondsPassed
        secondsPassed = 0
        
//        set title lable to hardness selected
        titleLable.text = hardness
        
//        initialize timer object with parameters
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        }
    
    @objc func updateTimer() {
    if secondsPassed < totalTime {
               
//        increment by 1 second each time the timer is updated (every second)
        secondsPassed += 1
        
//        status of progress bar
        progressBar.progress = Float(secondsPassed) / Float(totalTime)
        print(Float(secondsPassed) / Float(totalTime))
        
        
    } else {
//        reset timer
        timer.invalidate()
//        print to text label
        titleLable.text = "DONE!"
        
//        sound file url
        let url = Bundle.main.url(forResource: "B", withExtension: "wav")
//        instance of AVAudioPlayer object which uses sound file url
        player = try! AVAudioPlayer(contentsOf: url!)
//        play sound file
        player.play()
        
        }
    
    }

}

