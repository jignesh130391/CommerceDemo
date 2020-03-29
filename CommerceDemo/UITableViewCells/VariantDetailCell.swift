//
//  VariantDetailCell.swift
//  CommerceDemo
//
//  Created by Jignesh on 28/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import UIKit

class VariantDetailCell : UICollectionViewCell{
    
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblSizeValue: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblPriceValue: UILabel!
    @IBOutlet weak var lblColor: UILabel!
    @IBOutlet weak var lblColorValue: UILabel!
    
    static let identifier = "VariantDetailCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblSize.configureWithFont(fontName: AppFont.SFProDisplay_Regular, fontSize: .Body, andColor: .Gray97)
        lblSizeValue.configureWithFont(fontName: AppFont.SFProDisplay_Regular, fontSize: .Body, andColor: .Black)
        lblPrice.configureWithFont(fontName: AppFont.SFProDisplay_Regular, fontSize: .Body, andColor: .Gray97)
        lblPriceValue.configureWithFont(fontName: AppFont.SFProDisplay_Regular, fontSize: .Body, andColor: .Black)
        lblColor.configureWithFont(fontName: AppFont.SFProDisplay_Regular, fontSize: .Body, andColor: .Gray97)
        lblColorValue.configureWithFont(fontName: AppFont.SFProDisplay_Regular, fontSize: .Body, andColor: .Black)
    }
}
