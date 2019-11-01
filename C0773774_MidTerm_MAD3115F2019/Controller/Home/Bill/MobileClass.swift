//
//  MobileClass.swift
//  C0773774_F2019_MID_TERM_MAD3004
//
//  Created by Apple on 19/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

/// this class is used to define the operation and values of Mobile Bill
class MobileClass: BillClass, IPrintPC {
    
    // MARK: - Properties
    /// this is the name of mobile company
    var name = String()
    /// this is the name of plan name
    var plan = String()
    /// this is the name of mobile phone no.
    var phoneNo = String()

    /// this is data used of the plan
    var data = Float()
    var strData = String()
    /// this is used to concat "GB" with data
    var calData: String {
        get{
            let strResult = String(format: "%.2f GB", data)
            return strResult
        }set{
            strData = newValue
        }
    }
    
    /// this is used to save the minutes used
    var minutes = Int()
    var strMinutes = String()
    var calMinutes: String {
        get{
            let strResult = String(format: "%d minutes", minutes)
            return strResult
        }set(finalMin){
            strMinutes = finalMin
        }
    }
    
    
    // MARK: - Life Cycle
    /// this is used to initialize the properties of self classes and parent class
    init(billId: String, billDate: String, billAmount: Float, billType: String, comp_name: String, plan_name: String, phone_no: String, data_used: Float, minutes_used: Int) {
        
        // initializing the Bill Class
        super.init(bill_id: billId, bill_date: billDate, bill_amount: billAmount, bill_type: billType)
        
        //
        self.name = comp_name
        self.plan = plan_name
        self.phoneNo = phone_no
        self.data = data_used
        self.minutes = minutes_used
        
    }
    
    // MARK: - Functions
    /// this is used to print display
    func displayData() {
        // displaying the parent class property
        super.printData()
        
        print("   Manufacturer Name: ", self.name)
        print("   Unit Consumed: ", self.plan)
        print("   Mobile Number : ", self.phoneNo)
        self.strData = calData
        print("   Internet Usage : ", self.strData)
        self.strMinutes = calMinutes
        print("   Minutes Usage : ", self.strMinutes)
        
    }
   

}
