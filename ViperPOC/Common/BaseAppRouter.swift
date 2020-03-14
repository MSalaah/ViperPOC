//
//  BaseAppRouter.swift
//  ViperPOC
//
//  Created by Mohamed Salah on 3/12/20.
//  Copyright (c) 2020 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Swinject

public class BaseAppRouter: IAppRouter {
    
    public func presentModule<T>(_ view: T.Type, _ presentType: PresentType, _ animated: Bool, _ parameters: [String : Any]) where T : UIViewController {
        guard let vc = resolver.resolve(view,arguments: self as IAppRouter,parameters) else {return}
//        present(view: vc, animatedDisplay: true, animatedDismiss: true, presentType: .root)
        let params: [String: Any] = ["id": 12345, "name": "Rahul Katariya"]

        presentModule(parameters: params, presentType: presentType)
    }
    
    private var assembler: Assembler!
    let appDelegate = UIApplication.shared.delegate
    private var navigationController: UINavigationController?
    
    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    public var resolver: Resolver {
        return assembler.resolver
    }
    
    public func presentModule(parameters: [String: Any], presentType: PresentType) {
        let wireframe = self.resolver.resolve(ILoginWireframe.self, argument: self as IAppRouter)
        wireframe!.presentView(parameters: parameters, presentType: presentType)
       }
    
    public func present(view: UIViewController, animatedDisplay: Bool, animatedDismiss: Bool, presentType: PresentType) {
        switch presentType {
        case .root:
            appDelegate?.window??.rootViewController = UINavigationController(rootViewController: view)
            navigationController = appDelegate?.window??.rootViewController as? UINavigationController
        case .push:
            navigationController?.pushViewController(view, animated: animatedDisplay)
        case .present:
            navigationController?.present(view, animated: animatedDisplay, completion: nil)
        case .presentWithNavigationBar:
            let nav = UINavigationController(rootViewController: view)
            navigationController?.present(nav, animated: animatedDisplay) {
                self.navigationController = nav
            }
        case .modal:
            view.modalPresentationStyle = .overCurrentContext
            view.modalTransitionStyle = .crossDissolve
            navigationController?.present(view, animated: animatedDisplay, completion: nil)
        case .modalWithNavigationBar:
            let nav = UINavigationController(rootViewController: view)
            nav.modalPresentationStyle = .overCurrentContext
            nav.modalTransitionStyle = .crossDissolve
            navigationController?.present(nav, animated: animatedDisplay) {
                self.navigationController = nav
            }
        }
    }
    
    public func dismiss() {
        navigationController?.dismiss(animated: true) {
            self.navigationController = self.appDelegate?.window??.rootViewController as? UINavigationController
        }
    }
    
    public func popToRootViewController(animated: Bool) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    public func popViewController(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
}
