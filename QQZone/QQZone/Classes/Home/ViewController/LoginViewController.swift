//
//  LoginViewController.swift
//  QQZone
//
//  Created by 李军 on 2017/2/22.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // 做动画的视图
    @IBOutlet weak var animatedView: UIView!
    // 自动登录
    @IBOutlet weak var autoLoginBtn: UIButton!
    // 记住密码
    @IBOutlet weak var rememberPwdBtn: UIButton!
     // 用户名
    @IBOutlet weak var accountTF: UITextField!
    // 密码
    @IBOutlet weak var passwordTF: UITextField!
    // 动画转圈
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func rememberPwd(_ sender: Any) {
        rememberPwdBtn.isSelected = !rememberPwdBtn.isSelected;
        if !rememberPwdBtn.isSelected{
            autoLoginBtn.isSelected = false;
        }
    }
    
    @IBAction func autoLogin() {
        autoLoginBtn.isSelected = !autoLoginBtn.isSelected;
        if autoLoginBtn.isSelected{
            rememberPwdBtn.isSelected = true;
        }
    }
    

}

extension LoginViewController{
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
