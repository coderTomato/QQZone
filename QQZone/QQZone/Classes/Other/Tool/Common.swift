//
//  Common.swift
//  QQZone
//
//  Created by 李军 on 2017/2/23.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

func isLandScape() -> Bool {
    let bounds = UIScreen.main.bounds;
    return bounds.size.width > bounds.size.height;
}

// dock宽度
var dockWidth : CGFloat {
    return isLandScape() ? 210 : 70;
}

// dock tabbar 高度
var dockTabbarHeight : CGFloat{
    return isLandScape() ? 70 : 210;
}

// dock menue 高度
var dockMenuHeight : CGFloat{
    return 600;
}

// dock headerIcon 高度
var dockHeaderHeight : CGFloat {
    return isLandScape() ? 130 : 60;
}

// dock headerIcon 宽度
var dockHeaderWidth : CGFloat {
    return isLandScape() ? 90 : 60;
}

// dock headerIcon 宽度
var dockHeaderTop : CGFloat {
    return isLandScape() ? 40 : 100;
}
