//
//  AddMobileBillVC.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin on 06/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

protocol AddMobileBillVCDelegate : class {
    func moActionTrigger(str: String, field: String)
}

class AddMobileBillVC: UIViewController {
    
    // MARK: - Properties
    weak var delegate: AddMobileBillVCDelegate?
    
    @IBOutlet var providerView: UIView!
    @IBOutlet var provider_tf: UITextField!
    
    @IBOutlet var planView: UIView!
    @IBOutlet var plan_tf: UITextField!
    
    @IBOutlet var phonenoView: UIView!
    @IBOutlet var phoneNo_tf: UITextField!
    
    @IBOutlet var dataView: UIView!
    @IBOutlet var data_tf: UITextField!
    
    
    @IBOutlet var minutesView: UIView!
    @IBOutlet var minutes_tf: UITextField!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

 //
                intialSetup()
    }
            
    // MARK: - Helper
    func intialSetup() {
                //
                
        //        providerView.addBorder(view: providerView, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
        //        dataView.addBorder(view: dataView, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
    }
           
}

// MARK: - UITextFieldDelegates
extension AddMobileBillVC: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {

        //
        var txt_field = String()
        if textField == provider_tf {
            txt_field = "provider"
        }else if textField == plan_tf {
            txt_field = "plan"
        }else if textField == phoneNo_tf {
            txt_field = "phoneno"
        }else if textField == data_tf {
            txt_field = "data"
        }
        else if textField == minutes_tf {
            txt_field = "minutes"
        }
        self.delegate?.moActionTrigger(str: textField.text!, field: txt_field)
    }

}

