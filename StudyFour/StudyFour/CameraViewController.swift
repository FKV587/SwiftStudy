//
//  CameraViewController.swift
//  StudyFour
//
//  Created by 付凯 on 2016/11/23.
//  Copyright © 2016年 fukai. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {

    @IBOutlet weak var bigImageView: UIImageView!
    var captureSession : AVCaptureSession?
    var CaptureStillImageOutput : AVCaptureStillImageOutput?
    var captureVideoPreviewLayer : AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UIApplication.shared.isStatusBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        captureVideoPreviewLayer?.frame = bigImageView.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        let backCamera = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        var error : NSError?
        var input : AVCaptureDeviceInput!
        
        do {
            input = try AVCaptureDeviceInput(device: backCamera) }
        catch let error1 as NSError {
            error = error1
            input = nil
        }
        
        if (error == nil && captureSession?.canAddInput(input) != nil) {
            
            captureSession?.addInput(input)
            
            CaptureStillImageOutput = AVCaptureStillImageOutput()
            CaptureStillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
            
            if (captureSession?.canAddOutput(CaptureStillImageOutput) != nil) {
                captureSession?.addOutput(CaptureStillImageOutput)
                
                captureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                captureVideoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                captureVideoPreviewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.portrait
                bigImageView.layer.addSublayer(captureVideoPreviewLayer!)
                captureSession?.startRunning()
            }
            
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
