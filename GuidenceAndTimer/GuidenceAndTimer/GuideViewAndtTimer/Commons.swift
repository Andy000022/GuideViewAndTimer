//
//  Commons.swift
//  GuidenceAndTimer
//
//  Created by iSolar on 2017/12/5.
//  Copyright © 2017年 annlmj. All rights reserved.
//

import UIKit

// 屏幕宽、高
let kWidth : CGFloat  = UIScreen.main.bounds.size.width
let kHeight : CGFloat  = UIScreen.main.bounds.size.height

// iPhone X  分辨率 375x812 , 像素1125x2436,@3x
let iPhoneX = (kWidth == 375 && kHeight == 812)

// iPhone 6p 6sp 7p 8p 分辨率 414x736 , 像素1242x2208,@3x
let iPhone6p6sp7p8p = (kWidth == 414 && kHeight == 736)

// iPhone 5 5s 分辨率 320x568 , 像素640x1136,@2x
let iPhone55S  = (kWidth == 320 && kHeight == 568)

// iPhone 6 6s 7 8 分辨率 375x667 , 像素750x1334,@2x
let iPhone66s78  = (kWidth == 375 && kHeight == 667)

// Safe Area bottom margin
let SABMargin : CGFloat  = iPhoneX ? 34.0: 0.0

// Safe Area top margin
let SATMargin : CGFloat  = iPhoneX ? 24.0 : 0.0

let kNaviH : CGFloat  = 44.0

let kTabBarH : CGFloat  = iPhoneX ? (49.0 + SABMargin) : 49.0

let kStatusBarH : CGFloat  = iPhoneX ? 44.0 : 20.0

let viewFrameY: CGFloat = kStatusBarH + kNaviH

let viewH : CGFloat = (kHeight - viewFrameY - kTabBarH)

let kNaviMaxH : CGFloat = kStatusBarH + kNaviH


