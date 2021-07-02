//
//  AppDelegate.swift
//  TicTacToe
//
//  Created by Іван Захарчук on 10.06.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: -
    // MARK: Properties
    
    var window: UIWindow?
    
    private var gameViewController: GameSecondViewController<GameBoardView>?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let gameModel = GameElement()
        let constants = Constants()
        self.gameViewController = GameSecondViewController(gameModel: gameModel, constants: constants)
        window.rootViewController = gameViewController
        window.makeKeyAndVisible()
        self.window = window
       
        return true
    }
}

