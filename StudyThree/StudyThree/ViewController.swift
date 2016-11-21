//
//  ViewController.swift
//  StudyThree
//
//  Created by 付凯 on 2016/11/21.
//  Copyright © 2016年 fukai. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    var playViewLayer = AVPlayerLayer()
    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let button = UIButton.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        button.backgroundColor = UIColor.brown
        button.titleLabel?.text = "开始播放视频"
        button.addTarget(self, action:#selector(buttonAction(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        
    }
    
    func buttonAction(_ sender: UIButton) -> Void {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        let url = URL(fileURLWithPath: path!)
        playerView = AVPlayer(url: url)
        playViewLayer = AVPlayerLayer(player: playerView)

        playViewLayer.videoGravity = AVLayerVideoGravityResizeAspect
        playViewLayer.contentsScale = UIScreen.main.scale
        playViewLayer.frame = CGRect.init(x: 0, y: 0, width: 300, height: 200)
        self.view.layer.addSublayer(playViewLayer)
        // 位置放在最底下
        playerView.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

