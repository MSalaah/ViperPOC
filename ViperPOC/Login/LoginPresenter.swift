//
//  LoginPresenter.swift
//  ViperPOC
//
//  Created by Mohamed Salah on 3/12/20.
//  Copyright © 2020 Mohamed Salah. All rights reserved.
//

import Foundation


public protocol ILoginPresenter : IBasePresenter {
    
}

class LoginPresenter:BasePresenter<LoginViewController, LoginInteractor, LoginWireFrame>,ILoginPresenter {
    
    
    override init(_ view: LoginViewController, _ interactor: LoginInteractor, _ wireframe: LoginWireFrame) {
        super.init(view, interactor, wireframe)
    }
}
