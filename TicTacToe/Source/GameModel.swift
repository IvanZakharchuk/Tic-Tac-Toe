//
//  GameModel.swift
//  TicTacToe
//
//  Created by Іван Захарчук on 11.06.2021.
//

import UIKit

enum GameState: Int {
    
    case cross = 1
    case zero = 2
    
    mutating func toggle() -> GameState {
        switch self {
        case .cross:
            self = .zero
        case .zero:
            self = .cross
        }
        return self
    }
}

class GameElement {

    var turn = GameState.cross
    
    var gameIsActive = true
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // 0 as empty position
}

