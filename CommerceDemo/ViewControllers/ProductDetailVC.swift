//
//  ProductDetailVC.swift
//  CommerceDemo
//
//  Created by Jignesh on 28/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import UIKit

class ProductDetailVC: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblDateAdded: UILabel!
    @IBOutlet weak var lblTaxName: UILabel!
    @IBOutlet weak var lblTaxValue: UILabel!
    @IBOutlet weak var vwCont: UIView!
    @IBOutlet weak var collVariants: UICollectionView!
    @IBOutlet weak var pageCntrl: UIPageControl!
    
    //MARK:- Variables
    static let identifier = "ProductDetailVC"
    var productDet : Product? = nil
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setDetails()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK:- Set UI
    func setUI(){
        
        self.navigationItem.title = productDet?.name ?? "Product Details"
        self.navigationItem.hidesBackButton = true
        self.displayBackButton()
        
        lblProductName.configureWithFont(fontName: AppFont.SFProDisplay_Semibold, fontSize: .Heading, andColor: .Black)
        lblDateAdded.configureWithFont(fontName: AppFont.SFProDisplay_Regular, fontSize: .Body, andColor: .Gray97)
        lblTaxName.configureWithFont(fontName: AppFont.SFProDisplay_Regular, fontSize: .Body, andColor: .Gray97)
        lblTaxValue.configureWithFont(fontName: AppFont.SFProDisplay_Regular, fontSize: .Body, andColor: .Black)
        
        pageCntrl.currentPageIndicatorTintColor = AppColor.Gray97.getUIColor()
        pageCntrl.pageIndicatorTintColor = AppColor.Gray169.getUIColor()
        
        UtilityHelper.roundLayer(view: vwCont, radius: CORNER_RADIUS)
        UtilityHelper.setShadow(view: vwCont, color: AppColor.Gray169.getUIColor(), height: 0.0, radius: 3.0, opacity: 0.5)
        collVariants.clipsToBounds = true
    }
    
    func setDetails(){
        
        lblTaxName.text = ""
        lblTaxValue.text = ""
        
        if let productDetails = productDet{
            
            lblProductName.text = productDetails.name ?? DATA_NOT_FOUND.DASH.rawValue
            lblDateAdded.text = DateUtility.convertTimeStampToDesiredFormat(timestamp: productDetails.addedDate, dateFormat: DateUtility.DD_MMM_YYYY)
        
            if let taxDet = productDetails.tax{
                lblTaxName.text = "\(taxDet.name ?? "") : "
                lblTaxValue.text = "\(taxDet.tax)"
            }
        }else{
            lblProductName.text = DATA_NOT_FOUND.DASH.rawValue
            lblDateAdded.text = DATA_NOT_FOUND.TIME.rawValue
        }
        
        pageCntrl.numberOfPages = productDet?.variations?.count ?? 0
        if pageCntrl.numberOfPages > 0{
            pageCntrl.currentPage = 0
        }
    }
}

//MARK:- Table Delegate
extension ProductDetailVC : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productDet?.variations?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VariantDetailCell.identifier, for: indexPath) as! VariantDetailCell
        
        cell.lblSize.text = "Size : "
        cell.lblPrice.text = "Price : "
        cell.lblColor.text = "Color : "
        if let varDet = productDet?.variations?.allObjects[indexPath.item] as? Variants{
            cell.lblSizeValue.text = varDet.size > 0 ? "\(varDet.size)" : DATA_NOT_FOUND.DASH.rawValue
            cell.lblPriceValue.text = "\(varDet.price)"
            cell.lblColorValue.text = "\(varDet.color ?? DATA_NOT_FOUND.DASH.rawValue)"
        }else{
            cell.lblSizeValue.text = DATA_NOT_FOUND.DASH.rawValue
            cell.lblPriceValue.text = DATA_NOT_FOUND.DASH.rawValue
            cell.lblColorValue.text = DATA_NOT_FOUND.DASH.rawValue
        }
        
        return cell
    }
    
}

extension ProductDetailVC: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageCntrl.currentPage = Int(collVariants.contentOffset.x / self.collVariants.frame.size.width)
    }
    
    @IBAction func pageChanged(sender : UIPageControl){
        
        collVariants.scrollToItem(at: IndexPath(item: sender.currentPage, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
    }
}
