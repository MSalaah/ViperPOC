//
//  AppRouter.swift
//  ViperPOC
//
//  Created by Mohamed Salah on 3/12/20.
//  Copyright (c) 2020 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Swinject
import UIKit

public enum PresentType {
    case root, push, present, presentWithNavigationBar, modal, modalWithNavigationBar
}

public protocol IAppRouter {
    var resolver: Resolver { get }
    func present(view: UIViewController, animatedDisplay: Bool, animatedDismiss: Bool, presentType: PresentType)
    func popToRootViewController(animated: Bool)
    func popViewController(animated: Bool)
    func dismiss()
    
    
    func presentModule<T>(_ serviceType: T.Type, _ presentType: PresentType, _ animated: Bool, _ parameters: [String : Any])
}

public class AppRouter: BaseAppRouter {
    
    public static let shared = AppRouter.createAppRouter()
    
    public static var assembler = Assembler()

    private static func createAppRouter() -> AppRouter {

        assembler.apply(assemblies:[
                     CommonAssembly(),
                     LoginAssembly()
                     ])
        
        let router = AppRouter(assembler: assembler)
        
        return router
      
    }
}
