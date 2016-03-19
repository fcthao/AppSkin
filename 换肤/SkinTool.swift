//
//  SkinTool.swift
//  换肤
//
//  Created by 范伟 on 16/3/20.
//  Copyright © 2016年 FanWei. All rights reserved.
//

import UIKit

/// 用户偏好设置中的皮肤名字，第一次使用时，初始化为"orange"
private var skinName = NSUserDefaults.standardUserDefaults().stringForKey("skin") ?? "orange"

/// 应用程序皮肤工具类
class SkinTool {
    
    static func loadImageWithName(name: String) -> UIImage? {
        let image = UIImage(named: "\(skinName).bundle/\(name)")
        print("\(skinName).bundle/\(name)")
        return image
    }
    
    static func loadColorWithKey(key: String) -> UIColor? {
        let path = NSBundle.mainBundle().pathForResource("\(skinName).bundle/color", ofType: "plist")
        guard let pathStr = path else {
            return nil
        }
        let dict = NSDictionary(contentsOfFile: pathStr)
        guard let colorStr: String = dict?[key] as? String else {
            return nil
        }
        let arr = colorStr.componentsSeparatedByString(",")
        let red = CGFloat((arr[0] as NSString).doubleValue)
        let green = CGFloat((arr[1] as NSString).doubleValue)
        let blue = CGFloat((arr[2] as NSString).doubleValue)
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0)
    }
    
}
