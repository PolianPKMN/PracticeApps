//
//  CardModel.swift
//  Match
//
//  Created by Porter Anderson on 1/3/17.
//  Copyright © 2017 Porter Anderson. All rights reserved.
//

import UIKit

class CardModel: NSObject {

    func getCards() -> [Card]{
        
        var cardArray = [Card]()
        
        for _ in 1...8 {
            let randNum = Int(arc4random_uniform(13))
            
            let cardOne = Card()
            cardOne.cardVal = randNum
            
            let cardTwo = Card()
            cardTwo.cardVal = randNum
            
            cardArray += [cardOne, cardTwo]
        }
        
        for index in 0...cardArray.count-1 {
            
            let randNum = Int(arc4random_uniform(UInt32(cardArray.count)))
            
            let randomCard = cardArray[randNum]
            
            cardArray[randNum] = cardArray[index]
            cardArray[index] = randomCard
            
        }
        return cardArray
    }
}
