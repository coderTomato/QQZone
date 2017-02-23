//
//  QQMessageTool.swift
//  QQZone
//
//  Created by 李军 on 2017/2/23.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

class QQMessageTool: NSObject {

    class func showMessage(messageStr:String, toVc: UIViewController) {
        let alertVc = UIAlertController(title: "提示", message: messageStr, preferredStyle: .alert);
        /// 添加关闭的行为
        let action = UIAlertAction(title: "关闭", style: .default) { (action:UIAlertAction) in
            toVc.dismiss(animated: true, completion: nil);
        }
        alertVc.addAction(action);
        toVc.present(alertVc, animated: true, completion: nil);
    }
}
