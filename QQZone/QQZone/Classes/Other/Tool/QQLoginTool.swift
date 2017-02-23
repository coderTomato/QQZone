//
//  QQLoginTool.swift
//  QQZone
//
//  Created by 李军 on 2017/2/23.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

class QQLoginTool: NSObject {
    
    class func login(accountStr:String, pwdStr:String, result: @escaping (_ isSuccess:Bool)->()) {
        let time = DispatchTime.now() + 2;
        DispatchQueue.main.asyncAfter(deadline: time) { 
            if accountStr == "lijun" && pwdStr == "123"{
                result(true);
            }
            else{
                result(false);
            }
        }
    }
}
