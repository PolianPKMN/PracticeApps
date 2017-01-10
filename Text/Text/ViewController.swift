//
//  ViewController.swift
//  Text
//
//  Created by Porter Anderson on 1/8/17.
//  Copyright © 2017 Porter Anderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldText: UITextField!
    @IBOutlet weak var labelText: UILabel!
    
    @IBAction func textField(_ sender: Any) {
        labelText.text = textFieldText.text
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

