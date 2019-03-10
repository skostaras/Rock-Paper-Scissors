//
//  ViewController.swift
//  RPS
//
//  Created by Stefanos Kostaras on 08/03/2019.
//  Copyright © 2019 StefanosK27. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //must initialize, any would do
    var aRandomSign : Sign = .paper
    let kidsLaugh = SimpleSound(named: "kidsLaugh")
    let monkeyLaugh = SimpleSound(named: "monkeyLaugh")
    
    convenience init(aRandomSign : Sign) {
        self.init()
        self.aRandomSign = aRandomSign
    }
    
    @IBOutlet weak var monkeyButton: UIButton!
    @IBOutlet weak var monkeyHand: UILabel!
    @IBOutlet weak var dioPhoto: UIImageView!
    @IBOutlet weak var dioRock: UIButton!
    @IBOutlet weak var dioPaper: UIButton!
    @IBOutlet weak var dioScissors: UIButton!
    @IBOutlet weak var dioChoice: UILabel!
    @IBOutlet weak var replayBtn: UIButton!
    
    @IBAction func monkeyPlay(_ sender: Any) {
        updateUI(gameState: .diosTurn)
    }
    
    @IBAction func playRock(_ sender: Any) {
        play(chosenSign: .rock)
    }
    
    @IBAction func playPaper(_ sender: Any) {
        play(chosenSign: .paper)
    }
    
    @IBAction func playScissors(_ sender: Any) {
        play(chosenSign: .scissors)
    }
    
    @IBAction func playAgain(_ sender: Any) {
        updateUI(gameState: .start)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI(gameState: .start)
    }
    
    func updateUI(gameState: GameState) {
        switch gameState {
            
        case .start:
            monkeyButton.isEnabled = true
            monkeyButton.setTitle("🐵", for: .normal)
            monkeyHand.isHidden = true
            
            dioPhoto.isHidden = false
            dioPhoto.image = UIImage(named: "win3")
            dioChoice.isEnabled = false
            dioChoice.isHidden = true
            
            replayBtn.isEnabled = false
            replayBtn.isHidden = true
     
            dioRock.isHidden = true
            dioPaper.isHidden = true
            dioScissors.isHidden = true
            
            dioRock.isEnabled = false
            dioPaper.isEnabled = false
            dioScissors.isEnabled = false
            
        case .diosTurn:
            monkeyButton.isEnabled = false
            monkeyHand.isHidden = false
            
            aRandomSign =  randomSign()
            monkeyHand.text = aRandomSign.icon
            
            dioPhoto.image = UIImage(named: "tie2")
            
            dioRock.isHidden = false
            dioPaper.isHidden = false
            dioScissors.isHidden = false
            
            dioRock.isEnabled = true
            dioPaper.isEnabled = true
            dioScissors.isEnabled = true
            
        case .win:
            monkeyButton.setTitle("🙈", for: .normal)
            dioPhoto.image = UIImage(named: "win2")
            kidsLaugh.play()
            
        case .lose:
            monkeyButton.setTitle("🙉", for: .normal)
            dioPhoto.image = UIImage(named: "sad")
            monkeyLaugh.play()
            
        case .draw:
            monkeyButton.setTitle("🙊", for: .normal)
            dioPhoto.image = UIImage(named: "tie1")
        }
    }
    
    func play(chosenSign: Sign) {
        
        let newGameState = chosenSign.showSign(phonesSign: aRandomSign)
        
        updateUI(gameState: newGameState)
        
        dioChoice.isHidden = false
        dioChoice.text = chosenSign.dioIcon
        
        replayBtn.isEnabled = true
        replayBtn.isHidden = false
        
        dioRock.isEnabled = false
        dioPaper.isEnabled = false
        dioScissors.isEnabled = false

        dioRock.isHidden = true
        dioPaper.isHidden = true
        dioScissors.isHidden = true
    }

}

