//
//  GameConstants.swift
//  TicTacToe
//
//  Created by Іван Захарчук on 24.06.2021.
//

import Foundation

enum GameFigure: String {
    
    case cross = "cross"
    case zero = "zero"
    // почитатиь за мутатинг
    mutating func toggle() -> GameFigure {
        switch self {
        case .cross:
            self = .zero
        case .zero:
            self =  .cross
        }

        return self
    }
}

enum GameTexts: String {

    case crossWin = "Cross has won"
    case zeroWin = "Zero has won"
    case standOff = "Stand off"
}

struct Constants {

    let winCombination = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]
}
