//
//  CategoriesVC.swift
//  CommerceDemo
//
//  Created by Jignesh on 28/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var tblCategory: UITableView!
    
    //MARK:- Variables
    static let identifier = "CategoriesVC"
    var arrCategories : [Category]? = nil
    var parentCat : Category? = nil
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        if parentCat == nil{
            
            if !UserDefaults.standard.bool(forKey: "IS_DATA_LOADED"){
                
                UtilityHelper.getData { [weak self] isSucceed in
                    self?.getDetails()
                }
                UserDefaults.standard.set(true, forKey: "IS_DATA_LOADED")
            }else{
                self.getDetails()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK:- Set UI
    func setUI(){
        
        self.navigationItem.title = parentCat?.name ?? "Category"
        self.navigationItem.hidesBackButton = true
        tblCategory.estimatedRowHeight = 35.0
        tblCategory.rowHeight = UITableView.automaticDimension
        
        if parentCat != nil{
            self.displayBackButton()
        }
    }
    
    //MARK:- Get Details
    func getDetails(){
        arrCategories = DBHelper.getCategories(parentId: parentCat?.id ?? 0)
        tblCategory.reloadData()
    }
}

//MARK:- Table Delegate
extension CategoriesVC : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrCategories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblCategory.dequeueReusableCell(withIdentifier: CategoryCell.identifier) as! CategoryCell
        
        if let categoryDet = arrCategories?[indexPath.row]{
            cell.lblName.text = categoryDet.name ?? DATA_NOT_FOUND.DASH.rawValue
        }else{
            cell.lblName.text = DATA_NOT_FOUND.DASH.rawValue
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let categoryDet = arrCategories?[indexPath.row], let arrChildCat = DBHelper.getCategories(parentId: categoryDet.id){
            
            if !arrChildCat.isEmpty{
                
                let storyVC = UIStoryboard(name: StoryBoardName.PRODUCT, bundle: nil)
                if let catVC = storyVC.instantiateViewController(withIdentifier: CategoriesVC.identifier) as? CategoriesVC{
                    catVC.parentCat = categoryDet
                    catVC.arrCategories = arrChildCat
                    self.navigationController?.pushViewController(catVC, animated: true)
                }
            }else{
                
                let storyVC = UIStoryboard(name: StoryBoardName.PRODUCT, bundle: nil)
                if let prodVC = storyVC.instantiateViewController(withIdentifier: ProductsVC.identifier) as? ProductsVC{
                    prodVC.category = categoryDet
                    self.navigationController?.pushViewController(prodVC, animated: true)
                }
            }
        }
    }
}
