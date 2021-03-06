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
    /// 偏好设置中保存的皮肤名，第一次使用时，初始化为"orange"
    static var skinName: String = NSUserDefaults.standardUserDefaults().stringForKey("skin") ?? "blue"
    
    /**
     根据图像名称返回对应皮肤下的图像
     
     - parameter name: <#name description#>
     
     - returns: <#return value description#>
     */
    static func loadImageWithName(name: String) -> UIImage? {
        return UIImage(named: "\(skinName).bundle/\(name)")
    }
    /**
     加载字典中定义好的控件颜色方案
     
     - parameter key: <#key description#>
     
     - returns: <#return value description#>
     */
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
    /**
     保存用户选择的皮肤方案
     
     - parameter skinName: 皮肤名称
     */
    static func saveSkin(skinName: String?) {
        if let skinName = skinName {
            self.skinName = skinName
            NSUserDefaults.standardUserDefaults().setObject(skinName, forKey: "skin")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    /**
     返回当前皮肤设置下分段控件对应的索引
     
     - returns: 分段控件对应的索引
     */
    static func segmentIndex() -> Int {
        var index: Int = 0
        switch (skinName) {
        case "blue":
            index = 0
        case "green":
            index = 1
        case "orange":
            index = 2
        case "red":
            index = 3
        default:
            break
        }
        return index
    }
}
