//
//  Model.swift
//  TSD 13.1 UITextField
//
//  Created by Anton Zyabkin on 25.05.2022.
//

import Foundation
import UIKit

//добавим кнопку слева от текстфилда
let paddingView = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 0))
var passwordTF = UITextField ()
var firstNameTF = UITextField ()
var secondNameTF = UITextField ()
var emailTF = UITextField ()


func createTextField (coord: CGRect, plaseHolder: String, vC: UIViewController, jump: CGFloat) -> UITextField {
    let newTextField = UITextField ()
    newTextField.frame = coord
    newTextField.placeholder = "  " + plaseHolder
    newTextField.center.x = vC.view.center.x
    newTextField.font = UIFont(name: "AppleSymbols", size: 24)
    newTextField.backgroundColor = UIColor.white
    newTextField.layer.cornerRadius = 8
    newTextField.textAlignment = .natural
    

    
    //Добавим наш  ТФ на вью
    vC.view.addSubview(newTextField)
    
    
    // 
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: nil) { _ in
        vC.view.frame.origin.y = jump
    }
    
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification, object: nil, queue: nil) { _ in
        vC.view.frame.origin.y = 0
    }
    return newTextField
}

func createButton (title:  String, coord: CGRect, color: UIColor, vC: UIViewController) -> UIButton {
    let newButton = UIButton (frame: coord)
    newButton.setTitle(title, for: .normal)
    newButton.backgroundColor = color
    newButton.titleLabel?.font = UIFont(name: "AppleSymbols", size: 24)
    newButton.layer.cornerRadius = 8
    
    
    vC.view.addSubview(newButton)
    return newButton
}


//Создание лейбла
func createLabel (label : UILabel, coord : CGRect, text: String, textColor : UIColor, backgroundColor: UIColor, vC: UIViewController) -> Void {
    label.frame = coord
    label.text = text
    label.textColor = textColor
    label.backgroundColor = backgroundColor
    vC.view.addSubview(label)
}

