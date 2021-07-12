//
//  RootViewGetable.swift
//  TicTacToe
//
//  Created by Іван Захарчук on 01.07.2021.
//

import Foundation
import UIKit

protocol RootViewGetable {

    associatedtype RootView
    var rootView: RootView? { get }
}

extension RootViewGetable where Self: UIViewController, RootView: UIView {
    var rootView: RootView? {
        return self.view as? RootView
    }
}
