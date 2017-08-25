//
//  UIColor+JX.swift
//  AXWS
//
//  Created by Jiexiang on 2016/11/16.
//  Copyright © 2016年 Jiexiang. All rights reserved.
//

public extension UIColor {
    class func color(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
}
