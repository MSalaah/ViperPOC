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
   func navigateToHome()
}

class LoginWireFrame:BaseWireframe,ILoginWireframe {
    
    
    override func presentView(parameters: [String : Any], presentType: PresentType) {
        let view = router.resolver.resolve(LoginViewController.self, arguments: router, parameters)!
        router.present(view: view, animatedDisplay: true, animatedDismiss: true, presentType: presentType)
    }
    
    
    func navigateToHome() {
        AppRouter.shared.presentModule(ILoginWireframe.self, .push, true, [:])
    }
}
