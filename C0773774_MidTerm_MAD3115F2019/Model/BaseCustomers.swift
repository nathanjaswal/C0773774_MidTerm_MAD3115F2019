//
//  BaseCustomers.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin Jaswal on 01/11/19.
//  Copyright © 2019 Nitin Jaswal. All rights reserved.
//

import Foundation


struct BaseCustomers: Codable {
    
    var cust: [CustomersM]?
    
    enum CodingKeys: String, CodingKey {
        case cust = "Customers"
    }
}
