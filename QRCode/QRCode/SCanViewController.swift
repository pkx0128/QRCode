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

    var setms = MessageView()
    var session: AVCaptureSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        //获取系统视频捕捉硬件设备
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        do{
            //初始化视频捕设备
            let input = try AVCaptureDeviceInput(device: device)
            //初始化CaptureSessoin对象
            session = AVCaptureSession()
            //给Session添加输入设备
            session.addInput(input)
            //初始化CaptureMetadataOutput对象
            let output = AVCaptureMetadataOutput()
            //给session添加输出
            session.addOutput(output)
            //设置代理
            output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            output.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
            
            //设置视频捕捉图层
            let preview = AVCaptureVideoPreviewLayer(session: session)
            preview?.videoGravity = AVLayerVideoGravityResizeAspectFill
            preview?.frame = view.bounds
            view.layer.addSublayer(preview!)
            //开始视频捕捉
            session.startRunning()
            
            let qrbound = UIView()
            qrbound.layer.borderWidth = 2
            qrbound.layer.borderColor = UIColor.blue.cgColor
            qrbound.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            qrbound.center = view.center
            view.addSubview(qrbound)
            
            
            
            
        }catch {
            print(error)
        }
        
        
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        if metadataObjects.count == 0 || metadataObjects == nil {
            return
        }
        
        let mobj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        if mobj.type == AVMetadataObjectTypeQRCode {
            session?.stopRunning()
            setms.setMS = mobj.stringValue
            print(mobj.stringValue)
            print(setms)
            present(setms, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
