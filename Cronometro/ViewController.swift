//
//  ViewController.swift
//  Cronometro
//
//  Created by Heitor Augusto Pereira on 254//16.
//  Copyright © 2016 Heitor Augusto Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0.0
    var isPlaying = false
    var timer = NSTimer()

    @IBOutlet weak var screen: UILabel!
    @IBOutlet weak var startStop: UIButton!
    @IBOutlet weak var reset: UIButton!
    
    @IBAction func actionBTN(sender: UIButton) {
        if isPlaying {
            startStop.setTitle("START", forState: .Normal)
            timer.invalidate()
            isPlaying = false
            reset.enabled = true
            
        } else {
            startStop.setTitle("STOP", forState: .Normal)
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.running), userInfo: nil, repeats: true)
            isPlaying = true
            reset.enabled = false
        }
    }
    @IBAction func resetBTN(sender: UIButton) {
        counter = 0.0
        screen.text = String(counter)
        timer.invalidate()
        isPlaying = false
    }
    
    
    override func viewDidLoad() {
        reset.enabled = false
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func running() {
        counter = counter + 0.1
        screen.text = String(format: "%.1f", counter)
    }


}

