//
//  HomeViewController.swift
//  QQZone
//
//  Created by 李军 on 2017/2/23.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // 左侧视图控件占位
    lazy var leftView : QQDock = {
        let leftView = QQDock();
        leftView.delegate = self;
        leftView.backgroundColor = UIColor.clear;
        self.view.addSubview(leftView);
        return leftView;
    }();
    
    // 右侧视图控件占位
    lazy var rightView : UIView = {
        let rightView = UIView();
        rightView.backgroundColor = UIColor.brown;
        self.view.addSubview(rightView);
        return rightView;
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpInit();
    }
}

extension HomeViewController{
    
    func setUpInit(){
        view.backgroundColor = UIColor(red: 55 / 255.0, green: 55 / 255.0, blue: 55 / 255.0, alpha: 1);
    }
    
    // 调整状态栏
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent;
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews();
        //左侧视图frame
        leftView.frame = CGRect(x: 0, y: 0, width: dockWidth, height: view.height);
        //右侧视图frame
        rightView.frame = CGRect(x: dockWidth, y: 0, width: self.view.width - dockWidth, height: view.height);
    }
    
}

extension HomeViewController : QQDockDelegate{
    
    func qqduckDidClicked() {
        
    }
    
    func qqTabbarDidSelect(type: QQTabbarType) {
        if type == .Shuoshuo {
            print(type.rawValue);
        }
    }
}

