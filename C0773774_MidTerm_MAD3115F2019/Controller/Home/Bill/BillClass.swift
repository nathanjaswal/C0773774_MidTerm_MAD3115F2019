//
//  BillClass.swift
//  C0773774_F2019_MID_TERM_MAD3004
//
//  Created by Apple on 19/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

/// This is a bill main class
class BillClass {

    // MARK: - Properties
    /// this is the id of bill
    var id = String()
    /// this is date of bill
    var date = String()
    /// this is the type of bill
    var type = String()
    /// this is the amount of bill
    var amount = Float()
    /// this is used to save the final ammount
    var finalAmount = String()
    
    /// this is to concat "$"
    var calFinalAmount: String {
        get {
            let result = String(format: "$%.2f", amount)
            return result
        }
        set{
            finalAmount = newValue
        }
    }
    
    // MARK: - Life Cycle
    init(bill_id: String, bill_date: String, bill_amount: Float, bill_type: String) {
        self.id = bill_id
        self.date = bill_date
        self.type = bill_type
        self.amount = bill_amount
    }
    
    // MARK: - Functions
    func printData() {
        
        let str = """
                  ******************************************
                  """
        print(str)
        
        print("   Bill Id: ", self.id)
        print("   Bill Date: ", self.date)
        print("   Bill Type: ", self.type)
        self.finalAmount = calFinalAmount
        print("   Bill Amount: ", self.finalAmount)
        
    }

}
