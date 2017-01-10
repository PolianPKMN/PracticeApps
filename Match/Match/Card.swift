//
//  Card.swift
//  Match
//
//  Created by Porter Anderson on 1/3/17.
//  Copyright © 2017 Porter Anderson. All rights reserved.
//

import UIKit

class Card: UIView {

    let backImage = UIImageView()
    let frontImage = UIImageView()
    var cardVal = 0 
    let cardNames = ["card1", "card2", "card3", "card4", "card5", "card6", "card7","card8","card9","card10", "card11", "card12", "card13"]
    
    var flippedUp = false
    var isDone = false {
        didSet {
            if isDone == true{
                
                UIView.animate(withDuration: 1, delay: 1, options: .curveEaseOut, animations: {
                    self.backImage.alpha = 0
                   self.frontImage.alpha = 0
                }, completion: nil)
            }
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
       
        addSubview(backImage)
        
        backImage.translatesAutoresizingMaskIntoConstraints = false
        backImage.image = UIImage(named: "back")
        applySizeConstraints(imageView: backImage)
        applyPosConstrainst(imageView: backImage)
        
        addSubview(frontImage)
        
        frontImage.translatesAutoresizingMaskIntoConstraints = false
        frontImage.image = UIImage(named: "back")
        applySizeConstraints(imageView: frontImage)
        applyPosConstrainst(imageView: frontImage)

       
        
            }
    func applySizeConstraints(imageView: UIImageView){
         //image constraint.
        let height = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 170)
        let width = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
        imageView.addConstraints([height, width])
    }
    
    func applyPosConstrainst(imageView: UIImageView) {
        //image in view constraints
         let top = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: imageView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0)
        addConstraints([top, left])

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func flipUp(){
        
        frontImage.image = UIImage(named:cardNames[cardVal])
        
        UIView.transition(from: backImage, to: frontImage, duration: 1, options: .transitionFlipFromLeft, completion: nil)
        applyPosConstrainst(imageView: frontImage)
        flippedUp = true
    }
    
    func flipDown(){
        
        UIView.transition(from: frontImage, to: backImage, duration: 1, options: .transitionFlipFromRight, completion: nil)
        applyPosConstrainst(imageView: backImage)
        flippedUp = false
    }
}
