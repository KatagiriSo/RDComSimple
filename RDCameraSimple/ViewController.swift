//
//  ViewController.swift
//  RDCameraSimple
//
//  Created by 片桐奏羽 on 2016/01/08.
//  Copyright (c) 2016年 SoKatagiri. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    let session = AVCaptureSession()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let video = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        let input = AVCaptureDeviceInput(device: video, error: nil)
        
        if (session.canAddInput(input)) {
            session.addInput(input)
        }
        
        let selector = Selector("runtimeError:"), name = AVCaptureSessionRuntimeErrorNotification
        NSNotificationCenter.defaultCenter().addObserver(self, selector: selector, name:name , object: nil)
        
        // preview
        let prevLayer = AVCaptureVideoPreviewLayer.layerWithSession(session) as! AVCaptureVideoPreviewLayer
        prevLayer.frame = self.view.bounds
        self.view.layer.addSublayer(prevLayer)
        
        session.startRunning()
        
    }

    func runtimeError(notification:NSNotification)
    {
        if (session.running) {
            println("session is runnning")
        } else {
            println("session is not runnning")
        }
        if (session.interrupted) {
            println("session is interrupted")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

