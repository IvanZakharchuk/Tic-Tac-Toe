//
//  RootViewGetable.swift
//  TicTacToe
//
//  Created by Іван Захарчук on 01.07.2021.
//

import Foundation
import UIKit

protocol RootView: UIViewController {

    associatedtype RootView
    var rootView: RootView? { get }
}

extension RootView {
    func setRootView() -> RootView? {
        return self.view as? RootView
    }
}

class RootViewGetable<View: UIView>: UIViewController, RootView {
    
    typealias RootView = View
    
    var rootView: RootView? {
        self.setRootView()
    }
}
