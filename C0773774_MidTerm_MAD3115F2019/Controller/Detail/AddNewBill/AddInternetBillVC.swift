//
//  AddInternetBillVC.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin on 06/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

protocol AddInternetBillVCDelegate : class {
    func intrActionTrigger(str: String, field: String)
}

class AddInternetBillVC: UIViewController {
    
    // MARK: - Properties
    weak var delegate: AddInternetBillVCDelegate?
    
    @IBOutlet var providerView: UIView!
    @IBOutlet var provider_tf: UITextField!
    
    @IBOutlet var dataView: UIView!
    @IBOutlet var data_tf: UITextField!
    
    // MARK:- Life Cycle
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
extension AddInternetBillVC: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {

        //
        var txt_field = String()
        if textField == provider_tf {
            txt_field = "provider"
        }else{
            txt_field = "data"
        }
        self.delegate?.intrActionTrigger(str: textField.text!, field: txt_field)
    }

}
