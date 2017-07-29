//
//  AppDelegate.swift
//  QRCode
//
//  Created by pankx on 2017/7/29.
//  Copyright © 2017年 pankx. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //1、获取UIWindow对象
        window = UIWindow()
        //2、设置界面
        let vc = MainViewController()
        window?.rootViewController = vc
        //3、设置window的背景颜色
        window?.backgroundColor = UIColor.white
        //4、设置视图可见
        window?.makeKeyAndVisible()
        
        return true
    }

  

}

