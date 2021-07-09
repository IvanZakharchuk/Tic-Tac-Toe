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
// протокол который долежн обязывать все  наследуемые контрллеры возврошать рутовое вю указаного дженерик типа
// associated types in protocol
// в протоколе два поля асошиетид тайп и рут вю
//

class RootViewGetable<View: UIView>: UIViewController, RootView {
    
    typealias RootView = View
    
    var rootView: RootView? {
        return self.view as? View
    }
}

//protocol RootView: AnyObject {
//
//    typealias EmptyAction = () -> ()
//
//    var rootViewHandler: EmptyAction? { get set }
//}
//
//class RootViewGetable<View: RootView>: UIViewController, RootView {
//    var rootViewHandler: EmptyAction?
//
//    var rootView: UIView?
//
//    open func fill(with rootView: View) {
//        rootView.rootViewHandler = { [weak self] in self?.setView() }
//    }
//
//    func setView(on view: UIView? = nil) {
//        let rootView = UIView()
//        if view != nil {
//            view?.addSubview(rootView)
//        }
//        self.rootView = rootView
//    }
//}

//
//class RootViewGetable<View: RootView>: UIViewController, RootView {
//
//    typealias RootView = View.RootView
//
//    var rootView: View.RootView? {
//        return self.view as? RootView
//    }
//
//}
