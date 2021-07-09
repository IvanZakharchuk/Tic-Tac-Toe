//
//  GameBoardView.swift
//  TicTacToe
//
//  Created by Іван Захарчук on 11.06.2021.
//

import UIKit

enum GameBoardViewEvents {
    
    case buttonPressed(Int)
    case startNewGame
}

class GameBoardView: UIView {
    
    // MARK: -
    // MARK: Properties
        
    public var eventHandler: ((GameBoardViewEvents) -> ())?
    
    // MARK: -
    // MARK: IBOutlets
    
    @IBOutlet private var buttons: [UIButton]?
    @IBOutlet private var winningLabel: UILabel?
    @IBOutlet private var playAgain: UIButton?
    
    @IBOutlet private var gameField: UIView?
    
    // MARK: -
    // MARK: IBActions
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("Button \(sender.tag)")
        
        let tag = sender.tag
        self.eventHandler?(.buttonPressed(tag))
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        self.eventHandler?(.startNewGame)
    }
       
    // MARK: -
    // MARK: Public
    
    public func updateView(tag: Int, gameFigure: GameFigure) {
        let image = UIImage(named: gameFigure.rawValue)

        self.buttons?.first { $0.tag == tag }?.setImage(image, for: .normal)
    }
    
    public func startNewGame() {
        self.updateViewComponents(isNewGame: true)
        self.buttons?.forEach { $0.setImage(nil, for: .normal) }
    }
    
    public func updateViewComponents(isNewGame: Bool, text: String = "") {
        self.gameField?.isUserInteractionEnabled = isNewGame
        self.playAgain?.isHidden = isNewGame
        self.winningLabel?.isHidden = isNewGame
        self.winningLabel?.text = text
    }
}
