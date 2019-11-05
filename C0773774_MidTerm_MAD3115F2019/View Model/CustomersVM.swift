//
//  CustomerVM.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin on 05/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Foundation

class CustomersVM: NSObject {

    // MARK: - Properties
    var id: Int?
    var firstName: String?
    var lastName: String?
    var email: String?

    var bills: [BillM]?

    /// this is used to concat fisrt name and last name
    var calFull: String {
        get {
              return (firstName ?? "") + " " + (lastName ?? "")
           }
    }
    
    // MARK: - Life Cycle
    init(customer: CustomersM){
//        self.customer = customer
        self.id = customer.id
        self.firstName = customer.firstName
        self.lastName = customer.lastName
        self.email = customer.email

        self.bills = customer.bills
    }
    
}

// MARK:- UITableViewDataSource
extension CustomerListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Singelton.singObj.customerArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerListTVC", for: indexPath ) as! CustomerListTVC
        //
        let customerData = Singelton.singObj.customerArr[indexPath.row]
        //
        cell.setDisplay(customer: customerData)
        
        return cell
    }
    
}

// MARK:- UITableViewDelegate
extension CustomerListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        tableView.deselectRow(at: indexPath, animated: true)
        
        //
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CustomerDetailVC") as! CustomerDetailVC
        
        vc.custmDetail = Singelton.singObj.customerArr[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
