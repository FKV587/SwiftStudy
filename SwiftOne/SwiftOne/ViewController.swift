//
//  ViewController.swift
//  SwiftOne
//
//  Created by 付凯 on 2016/11/8.
//  Copyright © 2016年 fukai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var pause: UIButton!
    @IBOutlet weak var number: UILabel!
    
    var Counter = 0.0
    var Timer = Foundation.Timer()
    var IsPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        number.text = String(Counter);
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playAction(_ sender: UIButton) {
        if(IsPlaying) {
            return
        }
        play.isEnabled = false
        pause.isEnabled = true
        Timer = Foundation.Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        IsPlaying = true

    }
    
    @IBAction func pauseAction(_ sender: UIButton) {
        play.isEnabled = true
        pause.isEnabled = false
        Timer.invalidate()
        IsPlaying = false
    }
    
    func UpdateTimer() {
        Counter = Counter + 0.1
        number.text = String(format: "%.1f", Counter)
    }
    
}

