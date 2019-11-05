//
//  BillM.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin on 04/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

struct BillM: Codable {
    
    // MARK: - properties
    var id: Int?
    var date: String?
    var type: String?
    var amount: Float?
    var internet: InternetM
    var mobile: MobileM
    var hydro: HydroM
    
}
