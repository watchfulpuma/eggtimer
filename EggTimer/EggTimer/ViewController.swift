//
//  ViewController.swift
//  EggTimer
//
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
        
        @objc func updateTimer(){
            if secondsPassed < totalTime {
                secondsPassed += 1
                progressBar.progress = Float(secondsPassed) / Float(totalTime)
            } else {
                timer.invalidate()
                titleLabel.text = "DONE!"
                
                    guard let path = Bundle.main.path(forResource: "alarm_sound", ofType:"mp3") else {
                        return }
                    let url = URL(fileURLWithPath: path)

                    do {
                        player = try! AVAudioPlayer(contentsOf: url)
                        player.play()
                        
                    }
                }
            }
        }
    
    




