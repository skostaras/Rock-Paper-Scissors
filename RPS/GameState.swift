//
//  GameState.swift
//  RPS
//
//  Created by Stefanos Kostaras on 08/03/2019.
//  Copyright © 2019 StefanosK27. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    var statusMessage : String {
        switch self {
        case .start:
            return "Play!"
        case .win:
            return "You've won!"
        case .lose:
            return "You lose..."
        case .draw:
            return "It's a draw."
        }
    }
}
