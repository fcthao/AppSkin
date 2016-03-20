//
//  ThreeViewController.swift
//  换肤
//
//  Created by 范伟 on 16/3/20.
//  Copyright © 2016年 FanWei. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        imageView.image = SkinTool.loadImageWithName("heart")
//    }
    /**
     每次切换tabBarController的子控制器，都会执行一次
     
     - parameter animated: <#animated description#>
     */
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("\(classForCoder) \(__FUNCTION__)")
        imageView.image = SkinTool.loadImageWithName("rect")
    }
    
    deinit {
        print("\(classForCoder) \(__FUNCTION__)")
    }
}
