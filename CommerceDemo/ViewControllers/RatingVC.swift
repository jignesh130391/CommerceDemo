//
//  RatingVC.swift
//  CommerceDemo
//
//  Created by Jignesh on 28/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import UIKit

class RatingVC: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var vwContButtons: UIView!
    @IBOutlet weak var btnViewedProducts: UIButton!
    @IBOutlet weak var btnOrderedProducts: UIButton!
    @IBOutlet weak var btnSharedProducts: UIButton!
    @IBOutlet weak var vwSelectedOption: UIView!
    @IBOutlet weak var cnstLeadSelectedOption: NSLayoutConstraint!
    
    @IBOutlet weak var scrollVW: UIScrollView!
    @IBOutlet weak var tblViewedProducts: UITableView!
    @IBOutlet weak var tblOrderedProducts: UITableView!
    @IBOutlet weak var tblSharedProducts: UITableView!
    
    //MARK:- Variables
    static let identifier = "RatingVC"
    lazy var arrViewedProducts : [Ranking]? = {
        return DBHelper.getRatedProducts(type: "viewCount")
    }()
    lazy var arrOrderedProducts : [Ranking]? = {
        return DBHelper.getRatedProducts(type: "orderedCount")
    }()
    lazy var arrSharedProducts : [Ranking]? = {
        return DBHelper.getRatedProducts(type: "shredCount")
    }()
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK:- Set UI
    func setUI(){
        
        self.navigationItem.title = "Ranking"
        self.navigationItem.hidesBackButton = true
        tblViewedProducts.estimatedRowHeight = 35.0
        tblViewedProducts.rowHeight = UITableView.automaticDimension
        tblViewedProducts.register(UINib(nibName: ProductCell.identifier, bundle: nil), forCellReuseIdentifier: ProductCell.identifier)
        tblOrderedProducts.estimatedRowHeight = 35.0
        tblOrderedProducts.rowHeight = UITableView.automaticDimension
        tblOrderedProducts.register(UINib(nibName: ProductCell.identifier, bundle: nil), forCellReuseIdentifier: ProductCell.identifier)
        tblSharedProducts.estimatedRowHeight = 35.0
        tblSharedProducts.rowHeight = UITableView.automaticDimension
        tblSharedProducts.register(UINib(nibName: ProductCell.identifier, bundle: nil), forCellReuseIdentifier: ProductCell.identifier)
        self.displayBackButton()
        
        UtilityHelper.setShadow(view: vwContButtons, color: AppColor.Gray169.getUIColor(), height: 2.0, radius: 3.0, opacity: 0.5)
        vwSelectedOption.backgroundColor = AppColor.Gray169.getUIColor()
        btnViewedProducts.configureWithFont(fontName: AppFont.SFProDisplay_Regular, fontSize: .Body, andColor: .Gray169, controlState: .normal, backgroundColor: .White)
        btnViewedProducts.configureWithFont(fontName: AppFont.SFProDisplay_Semibold, fontSize: .Body, andColor: .Gray97, controlState: .selected, backgroundColor: .White)
        btnOrderedProducts.configureWithFont(fontName: AppFont.SFProDisplay_Regular, fontSize: .Body, andColor: .Gray169, controlState: .normal, backgroundColor: .White)
        btnOrderedProducts.configureWithFont(fontName: AppFont.SFProDisplay_Semibold, fontSize: .Body, andColor: .Gray97, controlState: .selected, backgroundColor: .White)
        btnSharedProducts.configureWithFont(fontName: AppFont.SFProDisplay_Regular, fontSize: .Body, andColor: .Gray169, controlState: .normal, backgroundColor: .White)
        btnSharedProducts.configureWithFont(fontName: AppFont.SFProDisplay_Semibold, fontSize: .Body, andColor: .Gray97, controlState: .selected, backgroundColor: .White)
        
        btnOptionClicked(sender: btnViewedProducts)
    }
    
    //MARK:- Button Actions
    @IBAction func btnOptionClicked(sender : UIButton){
        
        btnViewedProducts.isSelected = (sender == btnViewedProducts)
        btnOrderedProducts.isSelected = (sender == btnOrderedProducts)
        btnSharedProducts.isSelected = (sender == btnSharedProducts)
        self.cnstLeadSelectedOption.constant = sender.frame.origin.x

        var offsetX : CGFloat = 0.0
        if btnViewedProducts.isSelected{
            offsetX = tblViewedProducts.frame.origin.x
        }else if btnOrderedProducts.isSelected{
            offsetX = tblOrderedProducts.frame.origin.x
        }else if btnSharedProducts.isSelected{
            offsetX = tblSharedProducts.frame.origin.x
        }
        scrollVW.setContentOffset(CGPoint(x: offsetX, y: 0.0), animated: true)
    }
}

//MARK:- Table Delegate
extension RatingVC : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == tblViewedProducts{
            return arrViewedProducts?.count ?? 0
        }else if tableView == tblOrderedProducts{
            return arrOrderedProducts?.count ?? 0
        }else if tableView == tblSharedProducts{
            return arrSharedProducts?.count ?? 0
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier) as! ProductCell
        
        var details : Ranking? = nil
        if tableView == tblViewedProducts{
            details = arrViewedProducts?[indexPath.row]
        }else if tableView == tblOrderedProducts{
            details = arrOrderedProducts?[indexPath.row]
        }else if tableView == tblSharedProducts{
            details = arrSharedProducts?[indexPath.row]
        }
        
        if let productDet = details?.product{
            
            cell.lblName.text = (productDet.name ?? DATA_NOT_FOUND.DASH.rawValue)
            cell.lblDate.text = DateUtility.convertTimeStampToDesiredFormat(timestamp: productDet.addedDate, dateFormat: DateUtility.DD_MMM_YYYY)
            
        }else{
            cell.lblName.text = DATA_NOT_FOUND.DASH.rawValue
            cell.lblDate.text = DATA_NOT_FOUND.TIME.rawValue
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var details : Ranking? = nil
        if tableView == tblViewedProducts{
            details = arrViewedProducts?[indexPath.row]
        }else if tableView == tblOrderedProducts{
            details = arrOrderedProducts?[indexPath.row]
        }else if tableView == tblSharedProducts{
            details = arrSharedProducts?[indexPath.row]
        }
        if let prdDet = details?.product{
            UtilityHelper.redirectToProductDetails(navigation: self.navigationController!, productDet: prdDet)
        }
    }
}

extension RatingVC: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == scrollVW{
            
            btnViewedProducts.isSelected = false
            btnOrderedProducts.isSelected = false
            btnSharedProducts.isSelected = false
            
            if (scrollVW.contentOffset.x / self.view.frame.size.width) == 0{
                self.cnstLeadSelectedOption.constant = btnViewedProducts.frame.origin.x
                btnViewedProducts.isSelected = true
            }else if (scrollVW.contentOffset.x / self.view.frame.size.width) == 1{
                self.cnstLeadSelectedOption.constant = btnOrderedProducts.frame.origin.x
                btnOrderedProducts.isSelected = true
            }else if (scrollVW.contentOffset.x / self.view.frame.size.width) == 2{
                self.cnstLeadSelectedOption.constant = btnSharedProducts.frame.origin.x
                btnSharedProducts.isSelected = true
            }
        }
    }
}
