//
//  UtilityHelper.swift
//  CommerceDemo
//
//  Created by Jignesh on 06/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    func displayBackButton(){
        
        DispatchQueue.main.async {
            let btnBack = UIBarButtonItem(image: UIImage(named: "Back"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.btnBackClicked))
            self.navigationItem.leftBarButtonItem = btnBack
        }
    }
    
    @IBAction func btnBackClicked(){
        self.view.endEditing(true)
        self.navigationController?.popViewController(animated: true)
    }
}

extension UILabel {
    
    func configureWithFont(fontName: AppFont = .SFProDisplay_Regular, fontSize: AppFontSize, andColor color: AppColor, withAlpha alpha: CGFloat = 1.0){
        assert(alpha >= 0.0 && alpha <= 1.0)
        var font = UIFont(name: fontName.rawValue, size: fontSize.rawValue)
        if font == nil{
            font = UIFont.systemFont(ofSize: fontSize.rawValue)
        }
        self.font = font
        self.textColor = color.getUIColor(alpha: alpha)
    }
}

extension UIButton {
    
    func configureWithFont(fontName: AppFont = .SFProDisplay_Regular, fontSize: AppFontSize, andColor color: AppColor, withAlpha alpha: CGFloat = 1.0, controlState: UIControl.State, backgroundColor : AppColor){
        assert(alpha >= 0.0 && alpha <= 1.0)
        
        var font = UIFont(name: fontName.rawValue, size: fontSize.rawValue)
        if font == nil{
            font = UIFont.systemFont(ofSize: fontSize.rawValue)
        }
        self.titleLabel?.font = font
        self.setTitleColor(color.getUIColor(alpha: alpha), for: controlState)
        self.backgroundColor = backgroundColor.getUIColor()
    }
}
