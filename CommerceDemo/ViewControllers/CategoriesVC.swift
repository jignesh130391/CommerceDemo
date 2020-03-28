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
    lazy var arrCategories : [Category]? = {
        return DBHelper.getCategories(parentId: parentCat?.id ?? 0)
    }()
    
    var parentCat : Category? = nil
    
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
        
        self.navigationItem.title = "Category"
        self.navigationItem.hidesBackButton = true
        
        if parentCat != nil{
            self.displayBackButton()
        }
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblCategory.dequeueReusableCell(withIdentifier: CategoryCell.identifier) as! CategoryCell
        
        if let categoryDet = arrCategories?[indexPath.row]{
            cell.lblName.text = categoryDet.name ?? "-"
        }else{
            cell.lblName.text = "-"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let categoryDet = arrCategories?[indexPath.row]{
            let storyVC = UIStoryboard(name: StoryBoardName.PRODUCT, bundle: nil)
            if let catVC = storyVC.instantiateViewController(withIdentifier: CategoriesVC.identifier) as? CategoriesVC{
                catVC.parentCat = categoryDet
                self.navigationController?.pushViewController(catVC, animated: true)
            }
        }
    }
}
