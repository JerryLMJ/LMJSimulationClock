//
//  LMJSimulationClock.swift
//  LMJSimulationClockDemo
//
//  Created by LiMingjie on 2019/5/28.
//  Copyright © 2019 LMJ. All rights reserved.
//

import Foundation
import UIKit

// 图片资源来源于网络，版权归原作者所有，仅供学习交流使用
let ClockBgImg       = "clockBg"
let HourPointerImg   = "hourPointer"
let MinutePointerImg = "minutePointer"
let SecondPointerImg = "secondPointer"
// 图片资源来源于网络，版权归原作者所有，仅供学习交流使用


class LMJSimulationClock: UIView {
    fileprivate var _timer: Timer!
    fileprivate var _clockBg: UIImageView!
    fileprivate var _hPointer: UIImageView!
    fileprivate var _mPointer: UIImageView!
    fileprivate var _sPointer: UIImageView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        buildViews()
        createTimer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildViews()
        createTimer()
    }
    
    func buildViews() {
        _clockBg = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        _clockBg.image  = UIImage(named: ClockBgImg)
        _clockBg.center = CGPoint(x: self.frame.size.width/2.0, y: self.frame.size.height/2.0)
        self.addSubview(_clockBg)
        
        _hPointer = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 93))
        _hPointer.image             = UIImage(named: HourPointerImg)
        _hPointer.center            = CGPoint(x: _clockBg.frame.size.width/2.0, y: _clockBg.frame.size.height/2.0)
        _hPointer.layer.anchorPoint = CGPoint(x: 0.5, y: 0.92)
        _clockBg.addSubview(_hPointer)
        
        _mPointer = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 120))
        _mPointer.image             = UIImage(named: MinutePointerImg)
        _mPointer.center            = CGPoint(x: _clockBg.frame.size.width/2.0, y: _clockBg.frame.size.height/2.0)
        _mPointer.layer.anchorPoint = CGPoint(x: 0.5, y: 0.945)
        _clockBg.addSubview(_mPointer)
        
        _sPointer = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 220))
        _sPointer.image             = UIImage(named: SecondPointerImg)
        _sPointer.center            = CGPoint(x: _clockBg.frame.size.width/2.0, y: _clockBg.frame.size.height/2.0)
        _sPointer.layer.anchorPoint = CGPoint(x: 0.5, y: 0.65)
        _clockBg.addSubview(_sPointer)
    }

    func createTimer() {
        _timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            let calendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
            
            let hour = Float(calendar!.component(NSCalendar.Unit.hour, from: Date()))
            let minute = Float(calendar!.component(NSCalendar.Unit.minute, from: Date()))
            let second = Float(calendar!.component(NSCalendar.Unit.second, from: Date()))
            
            let hourAngle =  (hour * 3600.0 + minute * 60.0 + second) / (3600.0 * 12.0) * 2.0 * Float.pi
            let minuteAngle =  (minute * 60.0 + second) / 3600.0 * 2.0 * Float.pi
            let secondAngle = second / 60.0 * 2.0 * Float.pi
            
            self._hPointer.transform = CGAffineTransform(rotationAngle: CGFloat(hourAngle))
            self._mPointer.transform = CGAffineTransform(rotationAngle: CGFloat(minuteAngle))
            self._sPointer.transform = CGAffineTransform(rotationAngle: CGFloat(secondAngle))
        })
    }
}

