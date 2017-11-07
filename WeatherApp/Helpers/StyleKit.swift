//
//  StyleKit.swift
//  WeatherApp
//
//  Created by Przemysław Kuzia on 11/5/17
//  Copyright (c) 2017 pkuzia. All rights reserved.
//

import Foundation
import UIKit
import SwifterSwift

public enum Attribute {
    case navBarTitle, weatherScreenTopViewCityName, weatherScreenTopViewTemperature
}

public enum Color {
    case takeStockPinkBG
}

class StyleKit {
    
    // swiftlint:disable cyclomatic_complexity
    
    static func attributedText(text: String, attribute: Attribute) -> NSAttributedString {
        var attributedDictionary = [String: AnyObject]()
        switch attribute {
        case .navBarTitle:
            attributedDictionary = attributedText(color: UIColor.black, font: UIFont.systemFont(ofSize: 15))
        case .weatherScreenTopViewCityName:
            attributedDictionary = attributedText(color: UIColor.black, font: UIFont.systemFont(ofSize: 15, weight: UIFontWeightLight))
        case .weatherScreenTopViewTemperature:
            attributedDictionary = attributedText(color: UIColor.black, font: UIFont.systemFont(ofSize: 15, weight: UIFontWeightRegular))
        }
        return NSAttributedString(string: text, attributes: attributedDictionary)
    }
    
    static func colorType(color: Color) -> UIColor {
        switch color {
        case .takeStockPinkBG:
            return UIColor(hexString: "#E2CDE2")!
        }
    }
    
    
    static func attributedText(color: UIColor, font: UIFont, alignment: NSTextAlignment = .left) -> [String: AnyObject] {
        var attributedText = [String: AnyObject]()
        attributedText[NSForegroundColorAttributeName] = color
        attributedText[NSFontAttributeName] = font
        return attributedText
    }
}

