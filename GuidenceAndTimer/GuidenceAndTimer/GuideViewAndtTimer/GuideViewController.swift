//
//  GudienceViewController.swift
//  GuidenceAndTimer
//
//  Created by 刘梦佳 on 17/8/11.
//  Copyright © 2017年 annlmj. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController, UIScrollViewDelegate {

    var imgArr:[String] = [""]
    var pageControl = UIPageControl()
    var startBtn = UIButton()
    var timeBtn = UIButton()
    var timeCode = NSInteger()
    var timer: Timer?      //刷新时器
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.setupScrollView()
        self.startTimer()
    }
    
}

extension GuideViewController {

    fileprivate func setupScrollView() {
    
        let scroll = UIScrollView()
        scroll.delegate = self
        scroll.frame = self.view.frame
        scroll.bounces = false
        scroll.isPagingEnabled = true
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.contentSize = CGSize.init(width: kWidth*CGFloat(imgArr.count), height: kHeight)
        self.view.addSubview(scroll)
        
        startBtn = UIButton.init(frame: CGRect.init(x: kWidth * 0.3, y: iPhoneX ? kHeight * 0.85 : kHeight * 0.8, width: kWidth*0.4, height: 40))
        startBtn.setTitle("立即体验", for: .normal)
        startBtn.setTitleColor(UIColor.black, for: .normal)
        startBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        startBtn.backgroundColor = UIColor.white
        startBtn.tag = 100;
        startBtn.layer.cornerRadius = 5
        startBtn.isHidden = true
        self.view.addSubview(startBtn)
        startBtn.addTarget(self, action: #selector(GuideViewController.jumpToHomeVC), for: .touchUpInside)
        
        for index in 0..<imgArr.count {
            let img = UIImageView.init(frame: CGRect.init(x: kWidth * CGFloat(index), y: 0, width: kWidth, height: kHeight))
            img.image = UIImage(named:imgArr[index])
            scroll.addSubview(img)
        }
        
        pageControl = UIPageControl.init(frame: CGRect.init(x: (kWidth - 120)/2, y: iPhoneX ? (kHeight * 0.85 + 20) : (kHeight * 0.8 + 20), width: 120, height: 20))
        pageControl.currentPage = 0
        pageControl.numberOfPages = imgArr.count
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        pageControl.backgroundColor = UIColor.clear
        pageControl.pageIndicatorTintColor = UIColor.white
        self.view.insertSubview(pageControl, aboveSubview: scroll)
        
        timeBtn = UIButton.init(frame: CGRect.init(x: kWidth - 60, y: iPhoneX ? kNaviH : 30, width: 40, height: 20))
        timeBtn.backgroundColor = UIColor.white
        timeBtn.layer.cornerRadius = 5
        timeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        timeBtn.setTitleColor(UIColor.lightGray, for: .normal)
        self.view.insertSubview(timeBtn, aboveSubview: scroll)
        timeBtn.tag = 101;
        timeBtn.addTarget(self, action: #selector(GuideViewController.jumpToHomeVC), for: .touchUpInside)
        
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    //启动定时运行
    func startTimer() {
        if !(timer != nil) {
            self.timer = Timer.scheduledTimer(
                timeInterval: 2,
                target: self,
                selector: #selector(self.update),
                userInfo: nil,
                repeats: true)
        }
        
    }

    
}

extension GuideViewController {
    
    @objc fileprivate func jumpToHomeVC() {
    
        self.dismiss(animated: true) {
            
        }
    
    }
    
    @objc fileprivate func update() {
    
        timeBtn.setTitle("\(timeCode) 秒", for: .normal)
        timeCode -= 1
        if timeCode == 0 {
            self.jumpToHomeVC()
            self.stopTimer()
        }
    
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x/kWidth)
        
        if scrollView.contentOffset.x >= kWidth*CGFloat(imgArr.count-1) {
            
            startBtn.isHidden = false
        
        } else {
        
            startBtn.isHidden = true
        
        }
    }
}


