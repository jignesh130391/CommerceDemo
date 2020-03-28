//
//  CommerceConstants.swift
//  CommerceDemo
//
//  Created by Jignesh on 06/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import Foundation
import UIKit

enum StoryBoardName {
    static let PRODUCT = "Product"
}

let CORNER_RADIUS : CGFloat = 6.0

private let Color_Red = UIColor(red: 230/255.0, green: 53/255.0, blue: 77/255.0, alpha: 1.0)             //#B8325C
private let Color_Gray97 = UIColor(red: 97/255.0, green: 97/255.0, blue: 97/255.0, alpha: 1.0)            //#616161
private let Color_Gray169 = UIColor(red: 169/255.0, green: 169/255.0, blue: 169/255.0, alpha: 1.0)        //#A9A9A9
private let Color_Gray224 = UIColor(red: 224.0/255.0, green: 224.0/255.0, blue: 224.0/255.0, alpha: 1.0)  //#E0E0E0
private let Color_Gray242 = UIColor(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1.0)  //#F2F2F2
private let Color_White = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)  //#FFFFFF
private let Color_Black = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)  //#000000

enum AppColor{
    
    case Red
    case Gray97
    case Gray169
    case Gray224
    case Gray242
    case White
    case Black
    
    func getUIColor(alpha: CGFloat = 1.0) -> UIColor {
        
        switch self{
        case .Red:         return Color_Red.withAlphaComponent(alpha)
        case .Gray97:       return Color_Gray97.withAlphaComponent(alpha)
        case .Gray169:      return Color_Gray169.withAlphaComponent(alpha)
        case .Gray224:      return Color_Gray224.withAlphaComponent(alpha)
        case .Gray242:      return Color_Gray242.withAlphaComponent(alpha)
        case .White:      return Color_White.withAlphaComponent(alpha)
        case .Black:      return Color_Black.withAlphaComponent(alpha)
        }
    }
}

class URLConstants{
    static let SERVER_URL = "https://stark-spire-93433.herokuapp.com/json"    
}

enum AppFont: String {
    case SFProDisplay_Semibold = "SFProDisplay-Semibold"
    case SFProDisplay_Medium = "SFProDisplay-Medium"
    case SFProDisplay_Regular = "SFProDisplay-Regular"
    case SFProDisplay_Light = "SFProDisplay-Light"
}

enum AppFontSize: CGFloat {
    case ExtraLargeTitle = 35
    case SemiLargeTitle = 30
    case LargeTitle = 25
    case Title = 19
    case Heading = 17
    case Body = 15
    case Caption = 13
}


enum Table : String{
    
    case CATEGORY = "Category"
}
