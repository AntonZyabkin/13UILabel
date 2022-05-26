//
//  AuthenticationModule.swift
//  TSD 13.1 UITextField
//
//  Created by Anton Zyabkin on 26.05.2022.
//

import Foundation
import UIKit


var users = [String : String]()
let isEmptyLabel = UILabel ()





func checkTextField (vC: UIViewController) {
    
    if  (firstNameTF.text?.isEmpty)! ||
        (secondNameTF.text?.isEmpty)! ||
        (passwordTF.text?.isEmpty)! ||
        (emailTF.text?.isEmpty)! {
        print("here")
        createLabel(label: isEmptyLabel, coord: CGRect(x: 50, y: 400, width: 300, height: 40), text: "pleace, enter all text field", textColor: .red, backgroundColor: .clear, vC: vC)
        isEmptyLabel.center.x = vC.view.center.x
    } else {
        isEmptyLabel.text = ""
    }
}
