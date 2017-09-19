//
//  MainNavigationController.swift
//  Audible
//
//  Created by ebrahim hassan on 9/10/17.
//  Copyright © 2017 ebrahim hassan. All rights reserved.
//

import UIKit
class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        if isLogined(){
            showHomeController()
        }else{
            perform(#selector(ShowLoginController), with: nil,afterDelay:0.01)
        
        }
    }
    fileprivate func isLogined() -> Bool{
        return UserDefaults.standard.bool(forKey: "IsLoginIN")
    }
    func ShowLoginController()  {
        let loginController = LoginViewController()
        present(loginController, animated: true, completion: {})
    }
    func showHomeController() {
        let homeController = HomeController()
        viewControllers = [homeController ]
    }
}
class HomeController:UIViewController {
    let imgHome = UIImageView(image: UIImage(named: "Home"))
    func SingOut(){
        print("SIngOUT")
        UserDefaults.standard.set(false, forKey: "IsLoginIN")
        UserDefaults.standard.synchronize()
          dismiss(animated: true, completion: nil)
        let loginController = LoginViewController()
        present(loginController, animated: true, completion: {})
        
      
        
    }
    override func viewDidLoad() {
        navigationItem.title="You Are Logged IN"
        
        let singout = UIBarButtonItem(title: "SingOut", style: .plain, target: self, action: #selector(SingOut))
        navigationItem.leftBarButtonItem = singout
        view.backgroundColor = .yellow
        self.view.addSubview(imgHome)
        imgHome.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor , topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        //singout.action = #selector(SingOut)
    }
 

}
