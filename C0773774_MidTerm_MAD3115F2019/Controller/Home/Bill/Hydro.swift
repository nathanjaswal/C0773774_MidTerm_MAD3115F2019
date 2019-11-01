//
//  Hydro.swift
//  C0773774_F2019_MID_TERM_MAD3004
//
//  Created by Apple on 19/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation


/// this is the class to define the operation and values of Internet Bill
class HydroClass: BillClass, IPrintPC {
    
    // MARK: - Properties
    /// this is the agency name of Hydro Bill
    var name = String()
    /// this is units consumed by customer in Hydro Bill
    var units = Float()
    /// this is to concat the "MW" with units
    var final_units: String {
        get {
            let result = String(format: "%.2f MW", units)
            return result
        }
    }
    
    // MARK: - Life Cycle
    /// initializing the Internet Class
    init(billId: String, billDate: String, billAmount: Float, billType: String, agencyName: String, unitsConsumed: Float) {
        
        // initializing the Bill Class
        super.init(bill_id: billId, bill_date: billDate, bill_amount: billAmount, bill_type: billType)
        
        //
        self.name = agencyName
        self.units = unitsConsumed
        
    }
    
    // MARK: - Functions
    /// this is a protocol method to print data
    func displayData() {
        // print data of parent class(Bill Class)
        super.printData()
        
        // print local variables
        print("   Agency Name: ", self.name)
        let units = self.final_units
        print("   Unit Consumed: ", units)
    }
    
}
