//
//  SCanViewController.swift
//  QRCode
//
//  Created by pankx on 2017/7/29.
//  Copyright © 2017年 pankx. All rights reserved.
//

import UIKit
import AVFoundation

class SCanViewController: UIViewController ,AVCaptureMetadataOutputObjectsDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        //获取系统视频捕捉硬件设备
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        do{
            //初始化视频捕设备
            let input = try AVCaptureDeviceInput(device: device)
            //初始化CaptureSessoin对象
            let session = AVCaptureSession()
            //给Session添加输入设备
            session.addInput(input)
            //初始化CaptureMetadataOutput对象
            let output = AVCaptureMetadataOutput()
            //给session添加输出
            session.addOutput(output)
            
            output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            output.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
            
            //设置视频捕捉图层
            let preview = AVCaptureVideoPreviewLayer(session: session)
            preview?.videoGravity = AVLayerVideoGravityResizeAspectFill
            preview?.frame = view.bounds
            view.layer.addSublayer(preview!)
            //开始视频捕捉
            session.startRunning()
            
            
            
        }catch {
            print(error)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
