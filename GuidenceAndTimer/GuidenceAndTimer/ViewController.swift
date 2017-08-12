//
//  ViewController.swift
//  GuidenceAndTimer
//
//  Created by 刘梦佳 on 17/8/11.
//  Copyright © 2017年 annlmj. All rights reserved.
//

import UIKit
import ColorExtension

class ViewController: UIViewController {

    let defaults = UserDefaults.standard
    var codeView = MyPrivateTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaults.bool(forKey: "first")

        self.title = "引导页"
        
        self.view.backgroundColor = UIColor.white
        
        if !defaults.bool(forKey: "first") {
            
            defaults.set(true, forKey: "first")
            
            setupGudienceView()
            
        }
        
        
        let btn = UIButton.init(frame: CGRect.init(x: 100, y: 100, width: 120, height: 35))
        self.view.addSubview(btn)
        btn.setTitle("获取验证码", for: .normal)
        btn.backgroundColor = UIColor.init(hexString: "e3e2e0")
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.layer.cornerRadius = 5
        codeView.timeCode = 50
        codeView.codeBtn = btn
        btn.addTarget(self, action: #selector(self.timeDown), for: .touchUpInside)
    
    }
    
    func setupGudienceView() {
    
        let vc = GuideViewController()
        // 引导页image数组
        vc.imgArr = ["yindao_1","yindao_2","yindao_3","yindao_4"]
        // 引导页倒计时
        vc.timeCode = 10
        vc.modalTransitionStyle = .coverVertical
        
        let keyRootView = UIApplication.shared.keyWindow?.rootViewController
        
        DispatchQueue.main.async {
            
            keyRootView?.present(vc, animated: false) {
                
            }
        }
        

    }
    
    @objc fileprivate func timeDown() {
    
        codeView.isRestTime = true
        
    }

}

