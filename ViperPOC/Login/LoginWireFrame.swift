//
//  LoginWireFrame.swift
//  ViperPOC
//
//  Created by Mohamed Salah on 3/12/20.
//  Copyright © 2020 Mohamed Salah. All rights reserved.
//

import Foundation
import UIKit

public protocol ILoginWireframe: IBaseWireframe {
   func navigateToHome(parameters: [String : Any])
}

class LoginWireFrame:BaseWireframe,ILoginWireframe {
    
    func navigateToHome(parameters: [String : Any]) {
        AppRouter.shared.presentModule(LoginViewController.self,ILoginWireframe.self, .push, true, parameters)
    }
}
