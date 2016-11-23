//
//  ViewController.swift
//  StudyFour
//
//  Created by 付凯 on 2016/11/23.
//  Copyright © 2016年 fukai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let cvc : CameraViewController = CameraViewController(nibName: "CameraViewController", bundle: nil)
        
        self.addChildViewController(cvc)
        self.view.addSubview(cvc.view)
        cvc.didMove(toParentViewController: self)
        cvc.view.frame = self.view.bounds
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

