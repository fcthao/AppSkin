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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = SkinTool.loadImageWithName("heart")
    }

}
