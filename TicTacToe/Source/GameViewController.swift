//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Іван Захарчук on 11.06.2021.
//

import UIKit

class GameViewController<RootView>: UIViewController where RootView: GameBoardView {
    
    // MARK: -
    // MARK: Properties

    public var gameModel: GameElement
    public var constants: Constants
    
    // MARK: -
    // MARK: Initialization
    
    deinit {
        print("deinit")
    }
    
    public init(gameModel: GameElement, constants: Constants) {
        self.gameModel = gameModel
        self.constants = constants
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Private
    
    private func configureGameView() {
        self.rootView?.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
    }
    
    private func handle(event: GameBoardViewEvents) {
        switch event {
        case let .buttonPressed(tag):
            self.process(tag: tag)
        case .startNewGame:
            self.startNewGame()
        }
    }
    
    // MARK: -
    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureGameView()
    }

    // MARK: -
    // MARK: Public
    
    public func process(tag: Int) {
        let gameModel = self.gameModel
        
        if gameModel.gameState[tag-1] == 0 && gameModel.gameIsActive {
            gameModel.gameState[tag-1] = gameModel.turn.rawValue
           
//            gameModel.turn.rawValue == 1 ? self.rootView?.updateView(tag: tag, gameFigure: .cross)
//            let cross: ()? = self.rootView?.updateView(tag: tag, gameFigure: .cross)
//            let zero: ()? = self.rootView?.updateView(tag: tag, gameFigure: .zero)
            
//            let cross = self.rootView?.updateView(tag: tag, gameFigure: .cross)
//            let zero = self.rootView?.updateView(tag: tag, gameFigure: .zero)
//
//            if gameModel.turn.rawValue == 1 {
//                cross
//            } else {
//                zero
//            }
//
//            gameModel.turn.rawValue == 1
//                ? cross
//                : zero
//
                // убрать дублирование
            gameModel.turn.rawValue == 1
                ? (self.rootView?.updateView(tag: tag, gameFigure: .cross),
                   gameModel.turn = .zero) // следуйщий шаг - зиро(2)
                : (self.rootView?.updateView(tag: tag, gameFigure: .zero),
                   gameModel.turn = .cross) // следуйщий шаг - хрестик(1)

            self.processCombination()
            print(self.gameModel.gameState)
        }
    }
    
    public func startNewGame() {
        self.rootView?.startNewGame()
        
        self.gameModel.gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        self.gameModel.gameIsActive = true
        self.gameModel.turn = .cross
    }
    
    // MARK: -
    // MARK: Private
    
    private func processCombination() {
        let gameModel = self.gameModel
        let gameState = self.gameModel.gameState
        let winCombination = self.constants.winCombination
        
        winCombination.forEach { combination in
            if gameState[combination[0]] != 0
                && gameState[combination[0]] == gameState[combination[1]]
                && gameState[combination[1]] == gameState[combination[2]]
            {
                self.gameModel.gameIsActive = false
                //  поправить дублирование
                gameState[combination[0]] == 1
                    ? self.rootView?.updateViewComponents(isNewGame: false, text: GameTexts.crossWin.rawValue)
                    : self.rootView?.updateViewComponents(isNewGame: false, text: GameTexts.zeroWin.rawValue)
            }
        }
        
        if gameModel.gameIsActive {
            gameModel.gameIsActive = false
            gameModel.gameState.forEach {
                if $0 == 0 {
                    gameModel.gameIsActive = true
                }
            }
            
            if !gameModel.gameIsActive {
                self.rootView?.updateViewComponents(isNewGame: false, text: GameTexts.standOff.rawValue)
            }
        }
    }
}


extension GameViewController {
    var rootView: RootView? {
        return self.view as? RootView
    }
}
