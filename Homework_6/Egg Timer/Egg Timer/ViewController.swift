//
//  ViewController.swift
//  Egg Timer
//
//  Created by Alibek Baisholanov on 17.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    let eggTimes : [String : Int] = ["Soft" : 5, "Medium" : 420, "Hard" : 720]
    
    var player: AVAudioPlayer!
    var totalTime: Float = 0
    var secondsPassed: Float = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func timerStarted(_ sender: UIButton) {
        timer.invalidate()
        let eggType = sender.currentTitle!
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = eggType
        
        totalTime = Float(eggTimes[eggType]!)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    
    
    @objc func updateCounter(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress = secondsPassed / totalTime
            var remainingSeconds = Int(totalTime - secondsPassed)
            
            timerLabel.text = formatTime(remainingSeconds)
            progressBar.progress = percentageProgress
        }else{
            playAlarm()
            timer.invalidate()
            titleLabel.text = "Eggs are done!"
        }
    }
    
    func playAlarm(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func formatTime(_ seconds: Int) -> String{
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
}

