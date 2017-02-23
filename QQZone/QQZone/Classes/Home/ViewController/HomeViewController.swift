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
        setupChildVCs();
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
    
    func setupChildVCs() {
        addChildVc(vc: UIViewController(), title: "电子相框");
        addChildVc(vc: UIViewController(), title: "更多");
        addChildVc(vc: UIViewController(), title: "全部动态");
        addChildVc(vc: UIViewController(), title: "好友");
        addChildVc(vc: UIViewController(), title: "与我相关");
        addChildVc(vc: UIViewController(), title: "照片墙");
        addChildVc(vc: UIViewController(), title: "个人中心");
    }
    
    func addChildVc(vc: UIViewController, title:String) {
        vc.title = title;
        let nav = UINavigationController(rootViewController: vc);
        addChildViewController(nav);
    }
    
    func addChildVcView(selectedIndex: Int) {
        let subView = rightView.subviews.first;
        subView?.removeFromSuperview();
        
        let childVc = self.childViewControllers[selectedIndex];
        childVc.view.frame = rightView.bounds;
        rightView.addSubview(childVc.view);
    }
}

extension HomeViewController : QQDockDelegate{
    
    func qqduckDidClicked() {
        addChildVcView(selectedIndex: self.childViewControllers.count - 1);
    }
    
    func qqTabbarDidSelect(type: QQTabbarType) {
        if type == .Shuoshuo {
            let shuoVc = ShuoshuoViewController();
            let nav = UINavigationController(rootViewController: shuoVc);
            nav.modalPresentationStyle = .formSheet;
            nav.modalTransitionStyle = .flipHorizontal;
            present(nav, animated: true, completion: nil);
        }
    }
    
    func qqMenuDidSelected(index: Int) {
        addChildVcView(selectedIndex: index);
    }
}

