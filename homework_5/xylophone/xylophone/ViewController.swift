//
//  ViewController.swift
//  xylophone
//
//  Created by Alibek Baisholanov on 16.10.2024.
//

import UIKit
import AVFoundation
class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audio: AVAudioPlayer!
    var soundArray = ["A", "B", "C", "D", "E", "F", "G"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        var selectedSound = soundArray[(sender.tag) - 1]
        playingSound(choosedSound: selectedSound)
        
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            sender.alpha = 0.7
        }){_ in
            
            UIView.animate(withDuration: 0.1){
                sender.transform = CGAffineTransform.identity
                sender.alpha = 1.0
            }
            
        }
        
    }
    
    func playingSound(choosedSound: String){
        let soundUrl = Bundle.main.url(forResource: choosedSound, withExtension: ".wav")
        
        do{
            try audio = AVAudioPlayer(contentsOf: soundUrl!)
            audio.prepareToPlay()
            audio.play()
        }
        catch{
            print(error)
        }
    }
}

