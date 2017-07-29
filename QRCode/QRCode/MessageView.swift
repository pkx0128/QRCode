//
//  MessageView.swift
//  QRCode
//
//  Created by pankx on 2017/7/29.
//  Copyright © 2017年 pankx. All rights reserved.
//

import UIKit

class MessageView: UIViewController {
    var setMS : String!
    var messageLable: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        messageLable = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 100))
        messageLable?.text = setMS ?? ""
        messageLable?.center = view.center
        messageLable?.textAlignment = NSTextAlignment.center
        messageLable?.textColor = UIColor.red
        messageLable?.numberOfLines = 5
        messageLable?.adjustsFontSizeToFitWidth = true
        view.addSubview(messageLable!)
        
        let canelBnt = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        canelBnt.center = CGPoint(x: canelBnt.bounds.width / 2, y: view.bounds.height - (canelBnt.bounds.height / 2))
        canelBnt.backgroundColor = UIColor.blue
        canelBnt.setTitle("返回", for: .normal)
        canelBnt.addTarget(self, action: #selector(canel), for: .touchUpInside)
        view.addSubview(canelBnt)
//        print("ms:\(setMS)")
    }

    func canel() {
//        dismiss(animated: true, completion: nil)
        present(MainViewController(), animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
