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
let wrongEmail = UILabel()
let emailIsBusy = UILabel()
var usersData = [String : String]()


//MARK: - functions
func checkTextField (vC: UIViewController) {

    if  (firstNameTF.text?.isEmpty)! ||
        (secondNameTF.text?.isEmpty)! ||
        (passwordTF.text?.isEmpty)! ||
        (emailTF.text?.isEmpty)! {
        createLabel(label: isEmptyLabel, coord: CGRect(x: 50, y: 400, width: 300, height: 40), text: "pleace, enter all data", textColor: .red, backgroundColor: .clear, vC: vC)
        isEmptyLabel.textAlignment = .center
        
    } else {
        
        checkEmailTF(vC: vC)
        isEmptyLabel.text = ""
    }
}


func checkEmailTF (vC: UIViewController) {
    
    for i in emailTF.text! {
        
        if i == "@" {
            
            wrongEmail.text = ""
            checkEmailIsBusy(vC: vC)
            break
            
        } else {
            isEmptyLabel.text = ""
            createLabel(label: wrongEmail, coord: CGRect(x: 0, y: 330, width: 400, height: 30), text: "wrong e-mail", textColor: .red, backgroundColor: .clear, vC: vC)
            vC.view.addSubview(wrongEmail)
            wrongEmail.textAlignment = .center
        }
    }
}

func checkEmailIsBusy (vC: UIViewController) {
    var checkB = true
    
    for i in usersData.keys {
        
        if i == emailTF.text! {
            createLabel(label: emailIsBusy, coord: CGRect(x: 0, y: 330, width: 400, height: 30), text: "this e-mail is busy", textColor: .red, backgroundColor: .clear, vC: vC)
            emailIsBusy.textAlignment = .center
            vC.view.addSubview(emailIsBusy)
            checkB = false
            break
        }
    }
    
    if checkB {
        emailIsBusy.text = ""
        usersData[emailTF.text!] = passwordTF.text!
    }
}
