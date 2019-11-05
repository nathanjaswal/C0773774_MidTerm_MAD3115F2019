//
//  CustomerListVC.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin Jaswal on 31/10/19.
//  Copyright © 2019 Nitin Jaswal. All rights reserved.
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
        
        //
        initSetup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        //
        custmList_tv.reloadData()
        
    }
    
    // MARK:- Action
    @IBAction func signoutBtnClicked(_ sender: Any) {
        //
        let alertController = UIAlertController(title: "NJ", message: "Do You want to Sign Out?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive) {
            UIAlertAction in
            
            //
            self.navigationController?.popToRootViewController(animated: true)
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
       
    }
    
    @IBAction func addBtnClicked(_ sender: Any) {
        //
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddCustomerVC")
        self.present(vc, animated: true, completion: nil)
    }
    
    // MARK: - Helper
    func initSetup(){
        //
        populateCustomer()
        
    }
    
    func setUpUI() {
        //
        top_view.addShadow(view: top_view, color: UIColor.hexStringToUIColor(hex: "6D67FD").cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.5, radius: 5)
        
    }
    
    func populateCustomer() {
        // fetching data from json...
        let customers = DataSource.readJsonWith(name: "Customers")
        
        for cust_mer in customers {
            Singelton.singObj.customerArr.append(CustomersVM(customer: cust_mer))
        }
        
        //
        custmList_tv.reloadData()
    }
    
}

