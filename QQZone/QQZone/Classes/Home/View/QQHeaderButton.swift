//
//  QQHeaderButton.swift
//  QQZone
//
//  Created by 李军 on 2017/2/23.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

class QQHeaderButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame);
        imageView?.backgroundColor = UIColor.red;
        titleLabel?.textAlignment = .center;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews();
        if isLandScape(){
            let imageViewH = self.height * 0.8;
            imageView?.frame = CGRect(x: 0, y: 0, width: self.width, height:imageViewH);
            titleLabel?.frame = CGRect(x: 0, y: (imageView?.bottomY)!
                , width: self.width, height: self.height - imageViewH);
        }else {
            imageView?.frame = self.bounds;
            titleLabel?.frame = CGRect.zero;
        }
    }
}
