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


struct BillM: Codable {
    
    var internet: InternetM?
    var mobile: MobileM?
    var hydro: HydroM?
    
    //var bill: [NSDictionary]//
    
}

struct InternetM: Codable {
    
    var id: String?
    var date: String?
    var type: String?
    var amount: Float?
    var name: String?
    var data: Float?
}

struct MobileM: Codable {
    
    var id: String?
    var date: String?
    var type: String?
    var amount: Float?
    var name: String?
    var plan: String?
    var phoneNo: String?
    var data: Float?
    var minutes: String?
    
}

struct HydroM: Codable {
    
    var id: String?
    var date: String?
    var type: String?
    var amount: Float?
    var name: String?
    var units: Float?

}
