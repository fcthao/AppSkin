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
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        faceImageView.image = UIImage(named: "orange.bundle/face")
//        heartImageView.image = UIImage(named: "orange.bundle/heart")
//        rectImageView.image = UIImage(named: "orange.bundle/rect")
//        var skinName: String? = NSUserDefaults.standardUserDefaults().stringForKey("skin")
//        if skinName == nil {
//            skinName = "green"
//        }
//        applySkinWithSkinName(skinName!)
//        setSegemetedControlStatusWithSkinName(skinName!)
        applySkin()
        //初始化分段控件状态
        segmentedControl.selectedSegmentIndex = SkinTool.segmentIndex()
    }
    /**
     简单粗暴，直接从工具类中加载控件皮肤
     */
    private func applySkin() {
        faceImageView.image = SkinTool.loadImageWithName("face")
        heartImageView.image = SkinTool.loadImageWithName("heart")
        rectImageView.image = SkinTool.loadImageWithName("rect")
        //key在plist文件中定义
        myLabel.backgroundColor = SkinTool.loadColorWithKey("myLabel_bg");
        myLabel.textColor = SkinTool.loadColorWithKey("myLabel_textColor")
        myView.backgroundColor = SkinTool.loadColorWithKey("myView_bg")
    }
    

    /**
     分页控件值改变方法
     
     - parameter sender: 分段控件
     */
    @IBAction func clickSegmentedControl(sender: UISegmentedControl) {
        let skinName = segmentedControl.titleForSegmentAtIndex(sender.selectedSegmentIndex)?.lowercaseString
        SkinTool.saveSkin(skinName)
        applySkin()
    }
}

