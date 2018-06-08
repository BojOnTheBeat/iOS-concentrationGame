//
//  Concentration.swift
//  Concentration
//
//  Created by Bolaji Fatade on 6/7/18.
//  Copyright © 2018 Bolaji Fatade. All rights reserved.
//

import Foundation

class Concentration{
    
    var cards = [Card]()
    
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            //if no cards are faced up, just flip
            //if 2 cards are already faced up, choose another card(start a new match)
            //if 1 card already faced up, we choose another and see if they match
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                //either no cards or two cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }

        
    }
    
    
    init(numberOfPairsOfCards: Int){
        
        for _ in 1...numberOfPairsOfCards{
            
            //for each pair specified while initializing the game, add two of the same card
            //to the cards array
        
            let card = Card()
            cards += [card, card]
        
        }
        //TODO: Shuffle The Cards
        for k in stride(from: cards.count - 1, to: 0, by: -1) {
            cards.swapAt(Int(arc4random_uniform(UInt32(k + 1))), k)
        }
        
    }
    
}
