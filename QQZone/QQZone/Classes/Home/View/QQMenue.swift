//
//  QQMenue.swift
//  QQZone
//
//  Created by 李军 on 2017/2/23.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

protocol QQMenueDelegate {
    func qqMenuDidSelected(index:Int);
}

class QQMenue: UIView {

    var delegate : QQMenueDelegate?
    var selectedBtn : UIButton?;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        // 添加子控件
        addBtns()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBtns() {
        let imageNames = ["tab_bar_e_album_icon", "tab_bar_e_more_icon", "tab_bar_feed_icon", "tab_bar_friend_icon", "tab_bar_passive_feed_icon", "tab_bar_pic_wall_icon"]
        let titles = ["电子相框", "更多", "全部动态", "好友", "与我相关", "照片墙"]
        for i in 0..<imageNames.count{
            addBtn(imageName: imageNames[i], title: titles[i]);
        }
    }
    
    func addBtn(imageName:String, title:String){
        let btn = QQMenueButton();
        btn.setImage(UIImage(named:imageName), for: .normal);
        btn.setBackgroundImage(UIImage(named:"tabbar_separate_selected_bg"), for: .selected);
        btn.setTitle(title, for: .normal);
        btn.addTarget(self, action: #selector(btnClick), for:.touchDown);
        btn.tag = self.subviews.count;
        self.addSubview(btn);
    }
    
    func btnClick(btn:UIButton){
        selectedBtn?.isSelected = false;
        btn.isSelected = true;
        selectedBtn = btn;
        delegate?.qqMenuDidSelected(index: btn.tag);
    }
    
    func clearAll() {
        selectedBtn?.isSelected = false;
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        var index : CGFloat = 0;
        let height = self.height / CGFloat(self.subviews.count);
        for view in self.subviews {
            view.frame = CGRect(x: 0, y: index * height, width: self.width, height: height);
            index += 1;
        }
    }
}


