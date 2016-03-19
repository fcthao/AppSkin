//
//  SkinTool.swift
//  换肤
//
//  Created by 范伟 on 16/3/20.
//  Copyright © 2016年 FanWei. All rights reserved.
//

import UIKit
/// 应用程序皮肤工具类
class SkinTool {
    
    static func loadImageWithName(name: String) -> UIImage? {
        var skinName = NSUserDefaults.standardUserDefaults().stringForKey("skin")
        if skinName == nil {
            skinName = "orange"
        }
        let image = UIImage(named: "\(skinName!).bundle/\(name)")
        print("\(skinName).bundle/\(name)")
        return image
    }
}
