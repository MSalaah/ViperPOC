//
//  LoginViewController.swift
//  ViperPOC
//
//  Created by Mohamed Salah on 3/12/20.
//  Copyright © 2020 Mohamed Salah. All rights reserved.
//

import Foundation


public protocol ILoginViewController: IBaseViewController {
    func showData(data: [String])
    func showNoContentScreen()
}


class LoginViewController:BaseViewController<ILoginPresenter>,ILoginViewController{
    
    func showData(data: [String]) {
        print("Data Shown")
    }

    func showNoContentScreen() {
        print("No Content")
    }
    @IBAction func click(_ sender: Any) {
        showLoading()
        presenter.handleShowHome()
        hideLoading()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(presenter.parameters)
//        self.presenter.parameters = nil
    }
}
