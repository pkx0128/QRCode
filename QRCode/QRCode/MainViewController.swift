//
//  MainViewController.swift
//  QRCode
//
//  Created by pankx on 2017/7/29.
//  Copyright © 2017年 pankx. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //创建按钮
        let bnt = UIButton(frame: CGRect(x: 0, y: 0, width: view.bounds.width / 2, height: 50))
        bnt.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
        bnt.setTitle("开始扫描", for: .normal)
        bnt.setTitleColor(UIColor.black, for: .normal)
        bnt.backgroundColor = UIColor.blue
        bnt.addTarget(self, action: #selector(startbnt), for: .touchUpInside)
        view.addSubview(bnt)
        
        //创建Label
        let welLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 40))
        welLabel.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height  / 2 - bnt.bounds.height)
        welLabel.text = "欢迎使用QRCode二维码扫描"
        welLabel.textAlignment = NSTextAlignment.center
        view.addSubview(welLabel)
      
    }
    
    func startbnt() {
        present(SCanViewController(), animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

