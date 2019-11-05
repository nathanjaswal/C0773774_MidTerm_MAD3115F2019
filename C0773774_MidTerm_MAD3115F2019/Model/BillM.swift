//
//  BillM.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin on 04/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

struct BillM: Codable {
    
    // MARK: - Properties
    var internet: InternetM?
    var mobile: MobileM?
    var hydro: HydroM?
    
    //var bill: [NSDictionary]//
    
}

struct InternetM: Codable {
    
    // MARK: - Properties
    var id: String?
    var date: String?
    var type: String?
    var amount: Float?
    var name: String?
    var data: Float?
}

struct MobileM: Codable {
    
    // MARK: - Properties
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
    
    // MARK: - Properties
    var id: String?
    var date: String?
    var type: String?
    var amount: Float?
    var name: String?
    var units: Float?

}
