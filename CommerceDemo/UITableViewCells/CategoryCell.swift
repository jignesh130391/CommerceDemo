//
//  CategoryCell.swift
//  CommerceDemo
//
//  Created by Jignesh on 28/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import UIKit

class CategoryCell : UITableViewCell{
    
    @IBOutlet weak var lblName: UILabel!
    
    static let identifier = "CategoryCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblName.configureWithFont(fontName: AppFont.SFProDisplay_Semibold, fontSize: .Heading, andColor: .Gray97)
    }
}
