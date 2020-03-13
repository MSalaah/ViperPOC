//
//  BaseViewController.swift
//  ViperPOC
//
//  Created by Mohamed Salah on 3/12/20.
//  Copyright © 2020 Mohamed Salah. All rights reserved.
//

import Foundation
import UIKit


public protocol IBaseViewController: class {
    func showLoading()
    func hideLoading()
}

class BaseViewController<P>:UIViewController,IBaseViewController  {
   
    // Reference to the Presenter's interface.
    var presenter: P!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do someting here...
    }
    
    func showLoading() {
       print("Show Loading")
    }
    
    func hideLoading() {
        print("Hide Loading")

    }
}
