//
//  CustomerVM.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin on 05/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class CustomersVM: NSObject {

    // MARK: - Properties
    var id: Int?
    var firstName: String?
    var lastName: String?
    var email: String?

    var billDict: [BillM]?
    //var customer:  [CustomersM]?
    
    // MARK: - Life Cycle
    init(customer: CustomersM){
//        self.customer = customer
        self.id = customer.id
        self.firstName = customer.firstName
        self.lastName = customer.lastName
        self.email = customer.email

        self.billDict = customer.billDict
    }
    
}
