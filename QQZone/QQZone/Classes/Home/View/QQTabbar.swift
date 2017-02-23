//
//  QQTabbar.swift
//  QQZone
//
//  Created by 李军 on 2017/2/23.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

enum QQTabbarType : Int{
    case Rizhi
    case Shuoshuo
    case Camera
}

protocol QQTabbarDelegate {
    func qqTabbarDidSelect(type:QQTabbarType);
}

class QQTabbar: UIView {

    var delegate : QQTabbarDelegate?;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        // 添加三个子控件
        addBtns();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBtns() -> (){
        let imageArr = ["tabbar_blog", "tabbar_mood", "tabbar_photo"];
        for imageName in imageArr {
            let btn = UIButton();
            btn.setImage(UIImage(named: imageName), for: .normal);
            btn.tag = self.subviews.count;
            btn.addTarget(self, action: #selector(buttonClick), for: .touchDown);
            self.addSubview(btn);
        }
    }
    
    func buttonClick(btn:UIButton){
        delegate?.qqTabbarDidSelect(type: QQTabbarType(rawValue: btn.tag)!);
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var index : CGFloat = 0;
        for view in self.subviews {
            if isLandScape(){
                let width = self.width / CGFloat(self.subviews.count);
                view.frame = CGRect(x: index * width, y: 0, width: width, height: self.height);
            }else {
                let height = self.height / CGFloat(self.subviews.count);
                view.frame = CGRect(x: 0, y: index * height, width: self.width, height:height);
            }
            index += 1;
        }
    }
}
