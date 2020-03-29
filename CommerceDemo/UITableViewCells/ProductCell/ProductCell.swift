//
//  ProductCell.swift
//  CommerceDemo
//
//  Created by Jignesh on 28/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import UIKit

class ProductCell : UITableViewCell{
    
    @IBOutlet weak var vwCont: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    static let identifier = "ProductCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        UtilityHelper.roundLayer(view: vwCont, radius: CORNER_RADIUS)
        UtilityHelper.setShadow(view: vwCont, color: AppColor.Gray169.getUIColor(), height: 0.0, radius: 3.0, opacity: 0.5)
        lblName.configureWithFont(fontName: AppFont.SFProDisplay_Semibold, fontSize: .Heading, andColor: .Black)
        lblDate.configureWithFont(fontName: AppFont.SFProDisplay_Regular, fontSize: .Body, andColor: .Gray97)
    }
}
