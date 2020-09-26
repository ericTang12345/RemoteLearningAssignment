//
//  LoginManager.swift
//  LoginPage
//
//  Created by 唐紹桓 on 9/26/20.
//  Copyright © 2020 唐紹桓. All rights reserved.
//

import Foundation

enum SegmentedStatus: Int {
    case logIn = 0, signUp
}

class LoginManager {
    // 所有成功、錯誤訊息
    enum AlertMessage: String {
        case accountIsEmpty = "Account should not be empty"
        case passwordIsEmpty = "Password should not be empty"
        case checkPasswordIsEmpty = "check Password should not be empty"
        case signupSccessfull = "Congratulations, sign up successful"
        case loginSccessfull = "Congratulations, log in successful"
        case signupFall = "Signup fall"
        case loginFall = "Login fall"
    }
    
    var status:SegmentedStatus = .logIn
    
    func switchStatus(_ index: Int) {
        switch index {
        case 0: status = .logIn
        case 1: status = .signUp
        default: break
        }
    }
    
    // 想不到詞彙，執行
    func run(_ account: String,_ password: String, checkPassword: String?) -> (Bool,AlertMessage) {
        if account.count == 0 {
            return(false,AlertMessage.accountIsEmpty)
        }
        
        if password.count == 0 {
            return(false,AlertMessage.passwordIsEmpty)
        }
        
        switch status {
        case .logIn: return logIn(account, password)
        case .signUp: return signUp(account,password,checkPassword!)
        }
    }
    
    // 登入
    func logIn(_ account: String,_ password: String) -> (Bool,AlertMessage) {
        if account == "appworks_school@gmail.com" && password == "1234" {
            return (true,AlertMessage.loginSccessfull)
        } else {
            return (false,AlertMessage.loginFall)
        }
    }
    
    // 註冊
    func signUp(_ account:String,_ password: String,_ checkPassword: String) -> (Bool,AlertMessage) {
        if checkPassword.count == 0 {
            return(false,AlertMessage.checkPasswordIsEmpty)
        }
        if password == checkPassword {
            return (true,AlertMessage.signupSccessfull)
        } else {
            return (false,AlertMessage.signupFall)
        }
    }
    
}
