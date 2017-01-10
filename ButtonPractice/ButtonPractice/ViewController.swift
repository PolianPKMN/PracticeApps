//
//  ViewController.swift
//  ButtonPractice
//
//  Created by Porter Anderson on 1/3/17.
//  Copyright © 2017 Porter Anderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var Blue: UIButton!
    @IBOutlet weak var Red: UIButton!
    @IBOutlet weak var Green: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func GrnButton(_ sender: Any) {
        background.backgroundColor = UIColor.green
        Green.isHidden = true
        Blue.isHidden = false
        Red.isHidden = false
      
    }
   
    @IBAction func RedButton(_ sender: Any) {
        background.backgroundColor = UIColor.red
        Green.isHidden = false
        Blue.isHidden = false
        Red.isHidden = true
    }
    
    @IBAction func BlueButton(_ sender: Any) {
        background.backgroundColor = UIColor.blue
        Green.isHidden = false
        Blue.isHidden = true
        Red.isHidden = false
        
    }
}

