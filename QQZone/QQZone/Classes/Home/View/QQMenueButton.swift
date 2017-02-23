//
//  QQMenueButton.swift
//  QQZone
//
//  Created by 李军 on 2017/2/23.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

class QQMenueButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame);
        imageView?.contentMode = .center;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        if isLandScape(){
            imageView?.frame = CGRect(x: 0, y: 0, width: self.width * 0.3, height: self.height);
            titleLabel?.frame = CGRect(x: (imageView?.rightX)!, y: 0, width: self.width - (imageView?.width)!, height: self.height);
        }else {
            imageView?.frame = self.bounds;
            titleLabel?.frame = CGRect.zero;
        }
    }

}
