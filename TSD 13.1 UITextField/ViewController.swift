//
//  ViewController.swift
//  TSD 13.1 UITextField
//
//  Created by Anton Zyabkin on 25.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray

        // создадим и добавим несколько ТФ на Вью с помощью функции createTF
        print("i did it")
        firstNameTF = createTextField(coord: CGRect(x: 30, y: 150, width: 300, height: 40),
                                          plaseHolder: "First name",
                                          vC: self,
                                          jump: -50)
        
        secondNameTF = createTextField(coord: CGRect(x: 30, y: 220, width: 300, height: 40),
                                           plaseHolder: "Second name",
                                           vC: self,
                                           jump: -50)
        
        emailTF = createTextField(coord: CGRect(x: 30, y: 290, width: 300, height: 40),
                                      plaseHolder: "e-mail",
                                      vC: self,
                                      jump: -50)
        passwordTF = createTextField(coord: CGRect(x: 30, y: 360, width: 300, height: 40),
                                         plaseHolder: "Password",
                                         vC: self,
                                         jump: -50)

        paddingView.setImage(UIImage(systemName: "eye.slash")?.withRenderingMode(.alwaysTemplate), for: .normal)
        
        passwordTF.rightView = paddingView
        passwordTF.rightViewMode = UITextField.ViewMode.always
        passwordTF.isSecureTextEntry = true
        usersData["admin"] = "admin"



        // создадим две кнопки
        
        let singInButton = createButton(title: "sing in", coord: CGRect(x: view.center.x - 150, y: 490, width: 300, height: 40), color: .red, vC: self)
        
        let registrationButton = createButton(title: "registration", coord: CGRect(x: view.center.x - 150, y: 440, width: 300, height: 40), color: .green, vC: self)
       
        //MARK: - All targets
        paddingView.addTarget(self, action: #selector(securePassword), for: .touchUpInside)
        singInButton.addTarget(self, action: #selector(goEnterVC), for: .touchUpInside)
        registrationButton.addTarget(self, action: #selector(registration), for: .touchUpInside)
        
    }
    
    //MARK: - Methods
    
    // скрыть/показать пароль, изменить при этом иконку кнопки
    @objc func securePassword () {
        
        passwordTF.isSecureTextEntry.toggle()
        
        if passwordTF.isSecureTextEntry {
            paddingView.setImage(UIImage(systemName: "eye")?.withRenderingMode(.alwaysOriginal), for: .normal)
            passwordTF.isSecureTextEntry = false
        } else {
            paddingView.setImage(UIImage(systemName: "eye.slash")?.withRenderingMode(.alwaysOriginal), for: .normal)
            passwordTF.isSecureTextEntry = true
        }
        
        passwordTF.isSecureTextEntry = !passwordTF.isSecureTextEntry
    }
    
    // регистрация пользователя
    @objc func registration (sender: UIButton) {
        checkTextField (vC: self)
        
    }
    @objc func goEnterVC () {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextScreen = mainStoryboard.instantiateViewController(identifier: "EnterViewController") as? EnterViewController else {return}
        nextScreen.modalPresentationStyle = .fullScreen
        self.show(nextScreen, sender: nil)
    }
}

