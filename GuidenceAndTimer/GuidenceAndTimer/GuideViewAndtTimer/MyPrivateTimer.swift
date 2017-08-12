//
//  MyPrivateTimer.swift
//  GuidenceAndTimer
//
//  Created by 刘梦佳 on 17/8/11.
//  Copyright © 2017年 annlmj. All rights reserved.
//

import UIKit

class MyPrivateTimer {

    var timeCode = 60
    
    //定义一个私有定时器变量
    private var timer: Timer?
    //初始化一个UIButton供外部使用及定时器时间处理
    var codeBtn = UIButton()
    
    //定义一个定时剩余时间， 默认为0
    private var restTime: Int = 0 {
        willSet{
            //事件不为0 isCountDown的状态始终未true
            codeBtn.setTitle("\(newValue) 秒", for: .normal)
            //事件小于等于0 isCountDown的状态改变 按钮重置
            if newValue <= 0 {
                codeBtn.setTitle("重新获取验证码", for: .normal)
                isRestTime = false
            }
        }
    }
    
    //定义一个 是否正在倒计时的状态
    var isRestTime = false {
        willSet {
            if newValue {
                //创建定时器
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(restTimeAction), userInfo: nil, repeats: true)
                restTime = timeCode
                codeBtn.setTitleColor(UIColor.lightGray, for: .normal)
            } else {
                //如果isCountDown为false ,销毁定时器
                timer?.invalidate()
                timer = nil
                //按钮状态改变 重置
                codeBtn.setTitleColor(UIColor.brown, for: .normal)
                codeBtn.setTitle("重新获取验证码", for: .normal)
            }
            //如果isCountDown为true ,禁用按钮事件
            codeBtn.isEnabled = !newValue
        }
    }
    
    
    @objc private func restTimeAction() {
        restTime -= 1
    }
    
}
