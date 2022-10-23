//
//  AppStyles.swift
//  NasaGalleryApp
//
//  Created by Kapil Khedkar on 23/10/22.
//

import Foundation
import UIKit

enum FontStyle
{
    case titleText
    case subtitleText
    case placeholderText
    case ctaText
    
}

enum ColorStyle
{
    case iconTintColor
    case ctaBgColor
    case ctaTintColor
    case primaryTextColor
    case secondaryTextColor
    
}

class AppStyles
{
    static let itemCornerRadius : CGFloat = 8.0
    
    class func getFontStyle(style: FontStyle)->UIFont
    {
        switch style {
        case .titleText:
            return UIFont(name: "Poppins-Medium", size: 16.0)!
        case .subtitleText:
            return UIFont(name: "Poppins-Light", size: 14.0)!
        case .placeholderText:
            return UIFont(name: "Poppins-Light", size: 14.0)!
        case .ctaText:
            return UIFont(name: "Poppins-Medium", size: 18.0)!
        }
        
    }
    
    class func getAppColor(color: ColorStyle)->UIColor
    {
        switch color {
        case .iconTintColor:
            return UIColor.white
        case .ctaBgColor:
            return UIColor.red
        case .ctaTintColor:
            return UIColor.white
        case .primaryTextColor:
            return UIColor.black
        case .secondaryTextColor:
            return UIColor.gray
        }
        
    }
    
    
}
