//
//  Sign.swift
//  RPS
//
//  Created by Stefanos Kostaras on 08/03/2019.
//  Copyright © 2019 StefanosK27. All rights reserved.
//

import Foundation
import GameplayKit

let randomNr = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomNr.nextInt()
    switch sign {
    case 0:
        return .rock
    case 1:
        return .paper
    case 2:
        return .scissors
    //will never get here
    default:
        return .rock
    }
}

enum Sign {
    case rock, paper, scissors
    
    var icon: String {
        switch self {
        case .rock:
            return "✊🏽"
        case .paper:
            return "✋🏾"
        case .scissors:
            return "✌️"
        }
    }
    
    func showSign(phonesSign: Sign) -> GameState {
        
        switch self {
        case .rock:
            switch phonesSign {
            case .paper:
                return GameState.lose
            case .scissors:
                return GameState.win
            case .rock:
                return GameState.draw
            }
        case .paper:
            switch phonesSign {
            case .paper:
                return GameState.draw
            case .scissors:
                return GameState.lose
            case .rock:
                return GameState.win
            }
        case .scissors:
            switch phonesSign {
            case .paper:
                return GameState.win
            case .scissors:
                return GameState.draw
            case .rock:
                return GameState.lose
            }
        
        }
        
    }
}


