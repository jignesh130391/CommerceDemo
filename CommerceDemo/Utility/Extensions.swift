//
//  UtilityHelper.swift
//  CommerceDemo
//
//  Created by Jignesh on 28/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    func displayBackButton(){
        
        DispatchQueue.main.async {
            let btnBack = UIBarButtonItem(image: UIImage(named: "Back"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.btnBackClicked))
            btnBack.tintColor = UIColor.black
            self.navigationItem.leftBarButtonItem = btnBack
        }
    }
    
    @IBAction func btnBackClicked(){
        self.view.endEditing(true)
        self.navigationController?.popViewController(animated: true)
    }
    
    func displayRateButton(){
        
        DispatchQueue.main.async {
            let btnRate = UIBarButtonItem(image: UIImage(named: "Ranking"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.btnRatingClicked))
            btnRate.tintColor = UIColor.black
            self.navigationItem.rightBarButtonItem = btnRate
        }
    }
    
    @IBAction func btnRatingClicked(){
        self.view.endEditing(true)
        
        let storyBoard = UIStoryboard(name: StoryBoardName.PRODUCT, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: RatingVC.identifier) as! RatingVC
        self.navigationController?.pushViewController(vc, animated: true)
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
