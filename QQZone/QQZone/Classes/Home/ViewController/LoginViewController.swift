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

    }
}

extension LoginViewController{
    
    @IBAction func login() {
        // 获取用户名, 和密码
        let account = accountTF.text ?? "";
        let password = passwordTF.text ?? "";
        
        // 登录之前做的处理
        preLogin();
        // 发送给服务器, 验证身份
        QQLoginTool.login(accountStr: account, pwdStr: password) { (isSuceess:Bool) in
            if isSuceess{
                // 跳转界面
                UIApplication.shared.keyWindow?.rootViewController = HomeViewController();
            }else {
                // 错误动画
                self.loginError();
                // 提示信息
                QQMessageTool.showMessage(messageStr: "用户名或者密码错误", toVc: self);
            }
            self.endLogin();
        }
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
    
    func preLogin() -> () {
        // 1. 禁止用户交互
        view.isUserInteractionEnabled = false;
        // 2. 转圈动画开始
        indicatorView.startAnimating();
    }
    
    func endLogin() -> () {
        // 1. 开启用户交互
        view.isUserInteractionEnabled = true;
        // 2. 转圈动画停止
        indicatorView.stopAnimating();
    }
    
    func loginError() ->() {
        animatedView.layer.removeAnimation(forKey: "error");
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x");
        animation.values = [-20,-10,0,20, 10, 0];
        animation.duration = 0.2;
        animation.repeatCount = 4;
        animatedView.layer.add(animation, forKey: "error");
    }
}

extension LoginViewController{
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}

extension LoginViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == accountTF {
            passwordTF.becomeFirstResponder();
        }else{
            login();
        }
        return true;
    }
}
