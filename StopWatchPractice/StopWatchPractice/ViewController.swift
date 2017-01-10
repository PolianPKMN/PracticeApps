//
//  ViewController.swift
//  StopWatchPractice
//
//  Created by Porter Anderson on 1/7/17.
//  Copyright © 2017 Porter Anderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     var counter = 0.0
    var timer = Timer()
    var playing = false
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var stop: UIButton!
     @IBOutlet weak var timerLabel: UILabel!
    @IBAction func stop(_ sender: Any) {
        
        start.isEnabled = true
       
        stop.isEnabled = false
        
        timer.invalidate()
        playing = false
        
    }
    
    @IBAction func start(_ sender: Any) {
        
        if(playing) {
            return
        }
        start.isEnabled = false
        stop.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        playing = true
        
    }
    
    @IBAction func reset(_ sender: Any) {
        start.isEnabled = true
        stop.isEnabled = false
        
        timer.invalidate()
        playing = false
        counter = 0.0
        timerLabel.text = String(counter)
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        timerLabel.text = String(counter)
        stop.isEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func UpdateTimer() {
        counter = counter + 0.1
        timerLabel.text = String(format: "%.1f", counter)
    }
}

