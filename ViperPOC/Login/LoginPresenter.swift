//
//  LoginPresenter.swift
//  ViperPOC
//
//  Created by Mohamed Salah on 3/12/20.
//  Copyright © 2020 Mohamed Salah. All rights reserved.
//

import Foundation


public protocol ILoginPresenter : IBasePresenter {
    var parameters: [String: Any]? { get set }
}

class LoginPresenter:BasePresenter<LoginViewController, LoginInteractor, LoginWireFrame>,ILoginPresenter {
    var parameters: [String : Any]?
    
    
    
    override init(_ view: LoginViewController, _ interactor: LoginInteractor, _ wireframe: LoginWireFrame) {
        super.init(view, interactor, wireframe)
    
    }
}
