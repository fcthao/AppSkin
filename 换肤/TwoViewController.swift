//
//  TwoViewController.swift
//  换肤
//
//  Created by 范伟 on 16/3/20.
//  Copyright © 2016年 FanWei. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        let skinName: String? = NSUserDefaults.standardUserDefaults().stringForKey("skin")
        if let skinName = skinName {
            
            imageView.image = UIImage(named: "\(skinName).bundle/heart")
        }
        
    }
}
