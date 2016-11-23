//
//  ViewController.swift
//  StudyFive
//
//  Created by 付凯 on 2016/11/23.
//  Copyright © 2016年 fukai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var icon_image: UIImageView!
    @IBOutlet weak var visualeffectView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if #available(iOS 10.0, *) {
            let blurEffect = UIBlurEffect.init(style: UIBlurEffectStyle.regular)
            visualeffectView.effect = blurEffect
        } else {
            // Fallback on earlier versions
            let blurEffect = UIBlurEffect.init(style: UIBlurEffectStyle.light)
            visualeffectView.effect = blurEffect
        }
        self.icon_image.addSubview(visualeffectView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

