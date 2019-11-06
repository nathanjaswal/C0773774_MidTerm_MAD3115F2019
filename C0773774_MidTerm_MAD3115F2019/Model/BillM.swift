//
//  BillM.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin on 04/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

enum BillType: String, CaseIterable {
    case internet = "Internet", mobile = "Mobile", hydro = "Hydro", insurance = "Insurance"
}

struct BillM: Codable {
    
    // MARK: - Properties
    var id: String?
    var date: String?
    var type: String?
    var amount: Float?
    
    // Internet Properties
    var nameIn: String?
    var dataIn: Float?
    
    // Mobile Properties
    var nameMo: String?
    var planMo: String?
    var phoneNoMo: String?
    var dataMo: Float?
    var minutesMo: String?

    // Hydro Properties
    var nameHy: String?
    var unitsHy: Float?
    
}
