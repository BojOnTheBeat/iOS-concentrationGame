//
//  ViewController.swift
//  Concentration
//
//  Created by Bolaji Fatade on 6/7/18.
//  Copyright © 2018 Bolaji Fatade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"

        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var emojiChoices = ["👻", "🎃", "👻", "🎃"]
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        //flipCard(withEmoji: "👻", on: sender)
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            print("cardNumber = \(cardNumber)")
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }
    
}

