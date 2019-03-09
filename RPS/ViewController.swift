//
//  ViewController.swift
//  RPS
//
//  Created by Stefanos Kostaras on 08/03/2019.
//  Copyright © 2019 StefanosK27. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI(gameState: .start)
    }
    
    func updateUI(gameState: GameState) {
        switch gameState {
        case .start:
            gameStatus.text = GameState.start.statusMessage
//            view.backgroundColor = UIColor.white
            view.backgroundColor = UIColor.white
            sign.text = "🙉"
            playAgain.isHidden = true
            
            dioRock.isHidden = false
            dioRock.isEnabled = true
            dioPaper.isHidden = false
            dioPaper.isEnabled = true
            dioScissors.isHidden = false
            dioScissors.isEnabled = true
        case .win:
            gameStatus.text = GameState.win.statusMessage
            view.backgroundColor = UIColor.green
        case .lose:
            gameStatus.text = GameState.lose.statusMessage
            view.backgroundColor = UIColor.red
        case .draw:
            gameStatus.text = GameState.draw.statusMessage
            view.backgroundColor = UIColor.gray
        }
    }
    
    func play(chosenSign: Sign) {
        let phonesRandomSign = randomSign()
//        Sign.showHands(phonesHand2.: Sign)
        let newGameState = chosenSign.showSign(phonesSign: phonesRandomSign)
        updateUI(gameState: newGameState)
        sign.text = phonesRandomSign.icon
        
        dioRock.isEnabled = false
        dioPaper.isEnabled = false
        dioScissors.isEnabled = false
        
        switch chosenSign {
        case .rock:
            dioPaper.isHidden = true
            dioScissors.isHidden = true
        case .paper:
            dioRock.isHidden = true
            dioScissors.isHidden = true
        case .scissors:
            dioRock.isHidden = true
            dioPaper.isHidden = true
        }
        playAgain.isHidden = false
    }
    
    @IBOutlet weak var sign: UILabel!
    
    @IBOutlet weak var gameStatus: UILabel!
    

    @IBOutlet weak var dioRock: UIButton!

    @IBOutlet weak var dioPaper: UIButton!
    
    @IBOutlet weak var dioScissors: UIButton!
    
    @IBOutlet weak var playAgain: UIView!
    
    
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
    
}

