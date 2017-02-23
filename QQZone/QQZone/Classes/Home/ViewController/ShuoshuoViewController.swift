//
//  ShuoshuoViewController.swift
//  QQZone
//
//  Created by 李军 on 2017/2/23.
//  Copyright © 2017年 李军. All rights reserved.
//

import UIKit

class ShuoshuoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow;
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style:.done, target: self, action: #selector(close));
    }
    
    func close() {
        dismiss(animated: true, completion: nil);
    }

}
