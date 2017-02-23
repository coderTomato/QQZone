//
//  QQDock.swift
//  QQZone
//
//  Created by 李军 on 2017/2/23.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

protocol QQDockDelegate:QQTabbarDelegate {
    func qqduckDidClicked() -> ();
}

class QQDock: UIView {
    
    var delegate : QQDockDelegate?{
        didSet{
            bottomView.delegate = delegate;
        }
    }

    // 通过懒加载, 创建3个控件
    // 创建底部控件占位
    lazy var bottomView : QQTabbar = {
        let bottomView = QQTabbar();
        bottomView.backgroundColor = UIColor.clear;
        self.addSubview(bottomView);
        return bottomView;
    }();
    
    // 创建中间控件占位
    lazy var middleView : QQMenue = {
        let middleView = QQMenue();
        middleView.backgroundColor = UIColor.orange;
        self.addSubview(middleView);
        return middleView;
    }();
    
    // 创建头部控件
    lazy var headerIcon : QQHeaderButton = {
        let btn = QQHeaderButton();
        
        btn.setImage(UIImage(named: "tab_bar_pic_wall_icon"), for: .normal);
        
        return btn;
    }();
    
    
    override func layoutSubviews() {
        super.layoutSubviews();
        bottomView.frame = CGRect(x: 0, y: self.height - dockTabbarHeight, width: self.width, height: dockTabbarHeight);
        
        middleView.frame = CGRect(x: 0, y: self.height - dockTabbarHeight - dockMenuHeight, width: self.width, height: dockMenuHeight);
    }
}
