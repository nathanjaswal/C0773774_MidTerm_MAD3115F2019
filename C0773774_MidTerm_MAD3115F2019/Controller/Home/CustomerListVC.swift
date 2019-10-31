//
//  CustomerListVC.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Apple on 31/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class CustomerListVC: UIViewController {

    // MARK:- Properties
    @IBOutlet var top_view: UIView!
    @IBOutlet var custmList_tv: UITableView!
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK:- Action
    @IBAction func moreBtnClicked(_ sender: Any) {
       //
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func addBtnClicked(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddCustomerVC")
    }
    
    // MARK: - Helper
    func initSetup(){
        //
        
        
    }
    
    func setUpUI() {
        //
        top_view.addShadow(view: top_view, color: UIColor.hexStringToUIColor(hex: "6D67FD").cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.5, radius: 5)
        
        
    }
    
   

}
