//
//  ViewController.swift
//  LoginPage
//
//  Created by 唐紹桓 on 9/26/20.
//  Copyright © 2020 唐紹桓. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var checkLabel: UILabel!
    
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkTextField: UITextField!
    
    let logingManager = LoginManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        segmentedControl.tintColor = UIColor.black
    }
    
    // 判斷模式變更元件狀態
    func updateView() {
        switch logingManager.status {
        case .logIn:
            checkLabel.isEnabled = false
            checkTextField.isEnabled = false
            checkTextField.backgroundColor = UIColor.gray
        case .signUp:
            checkLabel.isEnabled = true
            checkTextField.isEnabled = true
            checkTextField.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        // 執行
        let (successful,message) = logingManager.run(accountTextField.text ?? "", passwordTextField.text ?? "", checkPassword: checkTextField.text)
        // 印出成功或著失敗訊息
        if successful {
            present(.messageAlert(title: "Successful", message: message.rawValue), animated: true, completion: nil)
        } else {
            present(.messageAlert(title: "Error", message: message.rawValue), animated: true, completion: nil)
        }
    }
    
    @IBAction func switchItem(_ sender: UISegmentedControl) {
        // 記錄狀況
        logingManager.switchStatus(sender.selectedSegmentIndex)
        // 每次切換清除文字
        accountTextField.text = ""
        passwordTextField.text = ""
        checkTextField.text = ""
        // 更新畫面
        updateView()
    }
}

extension UIViewController {
    static func messageAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let done = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(done)
        return alert
    }
}
