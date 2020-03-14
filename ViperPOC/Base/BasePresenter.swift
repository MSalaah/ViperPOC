//
//  BasePresenter.swift
//  ViperPOC
//
//  Created by Mohamed Salah on 3/12/20.
//  Copyright © 2020 Mohamed Salah. All rights reserved.
//

import Foundation

public protocol IBasePresenter: class {
    var parameters: [String: Any]? { get set }
}

class BasePresenter<V:IBaseViewController, I:IBaseInteractor, W:IBaseWireframe>:IBasePresenter{
    var parameters: [String : Any]?
    
    
    // Reference to the View (weak to avoid retain cycle).
    weak var view: V!

    // Reference to the Interactor's interface.
    var interactor: I!

    // Reference to the Router
    var wireframe: W!
    
    
    public init(_ view: V, _ interactor: I, _ wireframe: W) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}
