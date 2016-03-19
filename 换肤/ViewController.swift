//
//  ViewController.swift
//  换肤
//
//  Created by 范伟 on 16/3/19.
//  Copyright © 2016年 FanWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var faceImageView: UIImageView!
    
    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var rectImageView: UIImageView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(<#T##items: Any...##Any#>)
//        faceImageView.image = UIImage(named: "orange.bundle/face")
//        heartImageView.image = UIImage(named: "orange.bundle/heart")
//        rectImageView.image = UIImage(named: "orange.bundle/rect")
        var skinName: String? = NSUserDefaults.standardUserDefaults().stringForKey("skin")
        if skinName == nil {
            skinName = "green"
        }
        applySkinWithSkinName(skinName!)
        setSegemetedControlStatusWithSkinName(skinName!)
    }
    
    /**
     根据应用皮肤名称设置分段控件的状态
     
     - parameter skinName: 皮肤名称
     */
    private func setSegemetedControlStatusWithSkinName(skinName: String) {
        var index: NSInteger = 0
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
        segmentedControl.selectedSegmentIndex = index
    }

    /**
     根据皮肤名称设置相应控件对应颜色的图像
     
     - parameter skinName: <#skinName description#>
     */
    private func applySkinWithSkinName(skinName: String) {
        let heartImage = UIImage(named: "\(skinName).bundle/heart")
        heartImageView.image = heartImage
        let faceImage = UIImage(named: "\(skinName).bundle/face")
        faceImageView.image = faceImage
        let rectImage = UIImage(named: "\(skinName).bundle/rect")
        rectImageView.image = rectImage
        print(skinName)
    }
    /**
     分页控件值改变方法
     
     - parameter sender: 分段控件
     */
    @IBAction func clickSegmentedControl(sender: UISegmentedControl) {
//        let skinName: String
//        switch (sender.selectedSegmentIndex) {
//        case 0:
//            skinName = "blue"
//        case 1:
//            skinName = "green"
//        case 2:
//            skinName = "orange"
//        case 3:
//            skinName = "red"
//        default:
//            skinName = "orange"
//        }
//        NSUserDefaults.standardUserDefaults().setObject(skinName, forKey: "skin")
//        setSkinWithSkinName(skinName)
        let skinName = segmentedControl.titleForSegmentAtIndex(sender.selectedSegmentIndex)?.lowercaseString
        applySkinWithSkinName(skinName!)
        NSUserDefaults.standardUserDefaults().setObject(skinName, forKey: "skin")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

}

