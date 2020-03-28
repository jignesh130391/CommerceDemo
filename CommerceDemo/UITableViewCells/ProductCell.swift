//
//  CategoryCell.swift
//  CommerceDemo
//
//  Created by Jignesh on 28/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import UIKit

class ProductCell : UITableViewCell{
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    static let identifier = "ProductCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblName.configureWithFont(fontName: AppFont.SFProDisplay_Semibold, fontSize: .Title, andColor: .Black)
        lblDate.configureWithFont(fontName: AppFont.SFProDisplay_Regular, fontSize: .Body, andColor: .Gray97)
    }
}
