//
//  ProductsVC.swift
//  CommerceDemo
//
//  Created by Jignesh on 28/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import UIKit

class ProductsVC: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var tblProducts: UITableView!
    
    //MARK:- Variables
    static let identifier = "ProductsVC"
    lazy var arrProducts : [Product]? = {
        return DBHelper.getProducts(catId: category?.id ?? 0)
    }()
    var category : Category? = nil
    
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
        
        self.navigationItem.title = category?.name ?? "Products"
        self.navigationItem.hidesBackButton = true
        tblProducts.estimatedRowHeight = 35.0
        tblProducts.rowHeight = UITableView.automaticDimension
        tblProducts.register(UINib(nibName: ProductCell.identifier, bundle: nil), forCellReuseIdentifier: ProductCell.identifier)
        self.displayBackButton()
    }
}

//MARK:- Table Delegate
extension ProductsVC : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrProducts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblProducts.dequeueReusableCell(withIdentifier: ProductCell.identifier) as! ProductCell
        
        if let productDet = arrProducts?[indexPath.row]{
            cell.lblName.text = productDet.name ?? DATA_NOT_FOUND.DASH.rawValue
            cell.lblDate.text = DateUtility.convertTimeStampToDesiredFormat(timestamp: productDet.addedDate, dateFormat: DateUtility.DD_MMM_YYYY)
        }else{
            cell.lblName.text = DATA_NOT_FOUND.DASH.rawValue
            cell.lblDate.text = DATA_NOT_FOUND.TIME.rawValue
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
