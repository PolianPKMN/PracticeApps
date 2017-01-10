//
//  ViewController.swift
//  Match
//
//  Created by Porter Anderson on 1/3/17.
//  Copyright © 2017 Porter Anderson. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let model = CardModel()
    var cards = [Card]()
    var reveal:Card?
    var timer:Timer?
    var count = 40
    
    var cardFlipPlayer:AVAudioPlayer?
    var correctPlayer:AVAudioPlayer?
    var wrongPlayer:AVAudioPlayer?
    var shufflePlayer:AVAudioPlayer?

    var stackArray = [UIStackView]()
    @IBOutlet weak var SecondStack: UIStackView!
    @IBOutlet weak var FirstStack: UIStackView!
    @IBOutlet weak var ThirdStack: UIStackView!
    @IBOutlet weak var FourthStack: UIStackView!
    
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
        //Create sounds.
        let cardFlipPath = Bundle.main.path(forResource: "cardflip", ofType: "wav")
        let cardFlipUrl = URL(fileURLWithPath: cardFlipPath!)
        cardFlipPlayer = try AVAudioPlayer(contentsOf: cardFlipUrl)
        }
        catch{
            
        }
        
        do {
        let correctPath = Bundle.main.path(forResource: "dingcorrect", ofType: "wav")
        let correctUrl = URL(fileURLWithPath: correctPath!)
        correctPlayer = try AVAudioPlayer(contentsOf: correctUrl)
        }
        catch{
           //Didn't work
        }
        
        do {
            //Create sounds.
            let wrongPath = Bundle.main.path(forResource: "dingwrong", ofType: "wav")
            let wrongUrl = URL(fileURLWithPath: wrongPath!)
            wrongPlayer = try AVAudioPlayer(contentsOf: wrongUrl)
        }
            
        catch{
            
        }
        
        do {
            //Create sounds.
            let shufflePath = Bundle.main.path(forResource: "shuffle", ofType: "wav")
            let shuffleUrl = URL(fileURLWithPath: shufflePath!)
            shufflePlayer = try AVAudioPlayer(contentsOf: shuffleUrl)
        }
        catch{
            
        }


        //Create stack views
        stackArray += [FirstStack, SecondStack, ThirdStack, FourthStack]
        
        //Get cards
       cards = model.getCards()
        layoutCards()
        
        //Build timer.
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
        
    }
    
    func timerUpdate(){
        count -= 1
        
        if count == 0 {
            var userMatch = true
            timer?.invalidate()
            
            for card in cards {
                if card.isDone == false {
                    userMatch = false
                    break
                }
            }
            var popMessage = ""
            if userMatch == true {
                popMessage = "You Won!"
            }
            else {
               popMessage = "You weren't fast enough!"
            }
            let alert = UIAlertController(title: "Time's Up!", message: popMessage, preferredStyle: .alert)
                let alertAct = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(alertAct)
                present(alert, animated: true, completion: nil)
        }
        countLabel.text = String(count)
    }
    
    func layoutCards(){
        
        shufflePlayer?.play()
        
        var cardindex = 0
        
        for stack in stackArray{
            
            //Add four cards.
            for _ in 1...4 {
                
                if cardindex < cards.count {
                    
                    let card = cards[cardindex]
                    card.translatesAutoresizingMaskIntoConstraints = false
                    
                    let recognizer = UITapGestureRecognizer(target:self, action: #selector(tapped(gestureRecognizer:)))
                    card.addGestureRecognizer(recognizer)
                    
                    // set size.
                    let height = NSLayoutConstraint(item: card, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 170)
                    
                    let width = NSLayoutConstraint(item: card, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
                    
                    card.addConstraints([height, width])
                    
                    
                    stack.addArrangedSubview(card)
                    cardindex += 1
            }
            }
        }
    }
    
    func tapped(gestureRecognizer:UITapGestureRecognizer) {
       
        if count == 0 {
            return
        }
        
        cardFlipPlayer?.play()
        
        let card = gestureRecognizer.view as! Card
        
        if card.flippedUp == false{
        
            //Reveal
            card.flipUp()
            if reveal == nil {
                
                reveal = card
                
            }
            else{
                if card.cardVal == reveal?.cardVal {
                    
                    card.isDone = true
                    reveal?.isDone = true
                    correctPlayer?.play()
                    reveal = nil
                    
                }
                else{
                    
                    let _ = Timer.scheduledTimer(timeInterval: 1, target: card, selector: #selector(Card.flipDown), userInfo: nil, repeats: false)
                    
                    let _ = Timer.scheduledTimer(timeInterval: 1, target: reveal!, selector: #selector(Card.flipDown), userInfo: nil, repeats: false)

                    wrongPlayer?.play()
                    reveal = nil
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   }

