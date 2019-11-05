//
//  CustomersM.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin Jaswal on 01/11/19.
//  Copyright © 2019 Nitin Jaswal. All rights reserved.
//

import Foundation

struct CustomersM: Codable {
    
    // MARK: - Properties
    var id: Int?
    var firstName: String?
    var lastName: String?
    var email: String?
    
    var bills: [BillM] = []
    
}

