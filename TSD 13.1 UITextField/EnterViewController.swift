//
//  EnterViewController.swift
//  TSD 13.1 UITextField
//
//  Created by Anton Zyabkin on 27.05.2022.
//

import UIKit

class EnterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray

        
        emailTF = createTextField(coord: CGRect(x: 30, y: 290, width: 300, height: 40),
                                      plaseHolder: "e-mail",
                                      vC: self,
                                      jump: -50)
        passwordTF = createTextField(coord: CGRect(x: 30, y: 360, width: 300, height: 40),
                                         plaseHolder: "Password",
                                         vC: self,
                                         jump: -50)
        
        let singInButton = createButton(title: "sing in", coord: CGRect(x: view.center.x - 150, y: 490, width: 300, height: 40), color: .red, vC: self)

    }

}
