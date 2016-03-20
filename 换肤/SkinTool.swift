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
    /**
     加载偏好设置中的图像框皮肤设置，第一次使用时，初始化为"orange"
     
     - parameter name: <#name description#>
     
     - returns: <#return value description#>
     */
    static func loadImageWithName(name: String) -> UIImage? {
        let skinName = NSUserDefaults.standardUserDefaults().stringForKey("skin") ?? "orange"
        let image = UIImage(named: "\(skinName).bundle/\(name)")
        print("\(skinName).bundle/\(name)")
        return image
    }
    /**
     加载
     
     - parameter key: <#key description#>
     
     - returns: <#return value description#>
     */
    static func loadColorWithKey(key: String) -> UIColor? {
        let skinName = NSUserDefaults.standardUserDefaults().stringForKey("skin") ?? "orange"
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
    
    static func saveSkin(skinName: String?) {
        
        if let skinName = skinName {
            NSUserDefaults.standardUserDefaults().setObject(skinName, forKey: "skin")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
}
