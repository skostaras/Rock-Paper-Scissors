//
//  ViewController.swift
//  RPS
//
//  Created by Stefanos Kostaras on 08/03/2019.
//  Copyright © 2019 StefanosK27. All rights reserved.
//

import UIKit

//class MyCustomViewController: UIViewController {
//    var myString: String = ""
//
//    convenience init( myString: String ) {
//        self.init()
//
//        self.myString = myString
//    }
//}

class ViewController: UIViewController {
    
    var aRandomSign : Sign = .paper
    
    convenience init(aRandomSign : Sign) {
//        self.init()
        self.init()
        self.aRandomSign = aRandomSign
//        super.init()
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    var monkeysSign : Sign
//
//    init(monkeysSign : Sign) {
//        self.monkeysSign = monkeysSign
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override init() {
//        super.init()
//    }
    
    
    @IBOutlet weak var monkeyButton: UIButton!
    @IBOutlet weak var monkeyHand: UILabel!
    @IBOutlet weak var dioPhoto: UILabel!
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
            replayBtn.isEnabled = false
            replayBtn.isHidden = true
            dioChoice.isEnabled = false
            dioChoice.isHidden = true
//            dionisisButton.titleLabel?.font = .systemFont(ofSize: 130)
            monkeyButton.isEnabled = true
            monkeyButton.setTitle("🐵", for: .normal)
            monkeyHand.isHidden = true
            
            dioPhoto.isHidden = false
            dioPhoto.isEnabled = false
//            dionisisButton.
            //TODO
            dioPhoto.text = "😎"
            dioPhoto.font = dioPhoto.font.withSize(130)
//            dionisisButton.setImage(<#T##image: UIImage?##UIImage?#>, for: .normal)
            
            dioRock.isHidden = true
            dioPaper.isHidden = true
            dioScissors.isHidden = true
            
            dioRock.isEnabled = false
            dioPaper.isEnabled = false
            dioScissors.isEnabled = false
            
            //shouldn't matter
//            return Sign.paper
            
        case .diosTurn:
//            monkeyButton.setTitle("🐵", for: .normal)
            monkeyButton.isEnabled = false
            monkeyHand.isHidden = false
            
            
            aRandomSign =  randomSign()
            
//            let monkeysSign = aRandomSign.init(monkeysSign: randomSign())
            
//            monkeysSign = randomSign()
            
            
//            let phonesRandomSign = randomSign()
            monkeyHand.text = aRandomSign.icon
            
            
            dioRock.isHidden = false
            dioPaper.isHidden = false
            dioScissors.isHidden = false
            
            dioRock.isEnabled = true
            dioPaper.isEnabled = true
            dioScissors.isEnabled = true
            
//            return phonesRandomSign
            
        case .win:
            monkeyButton.setTitle("🙈", for: .normal)
            //TODO
             dioPhoto.text = "😁"
//            dionisisButton.setTitle("😁", for: .normal)
//            dionisisButton.setImage(<#T##image: UIImage?##UIImage?#>, for: .normal)
            
        case .lose:
            monkeyButton.setTitle("🙉", for: .normal)
            //TODO
            dioPhoto.text = "☹️"
//            dionisisButton.setTitle("☹️", for: .normal)
//            dionisisButton.setImage(<#T##image: UIImage?##UIImage?#>, for: .normal)
            
        case .draw:
            monkeyButton.setTitle("🙊", for: .normal)
            //TODO
             dioPhoto.text = "😕"
//            dionisisButton.setTitle("😕", for: .normal)
//            dionisisButton.setImage(<#T##image: UIImage?##UIImage?#>, for: .normal)
        }
    }
    
    func play(chosenSign: Sign) {
        
        let newGameState = chosenSign.showSign(phonesSign: aRandomSign)
        
        updateUI(gameState: newGameState)
        
        dioChoice.isHidden = false
        
        dioChoice.text = chosenSign.dioIcon
        
        dioRock.isEnabled = false
        dioPaper.isEnabled = false
        dioScissors.isEnabled = false

        dioRock.isHidden = true
        dioPaper.isHidden = true
        dioScissors.isHidden = true
        
        replayBtn.isEnabled = true
        replayBtn.isHidden = false
    }
    

    

    
}

