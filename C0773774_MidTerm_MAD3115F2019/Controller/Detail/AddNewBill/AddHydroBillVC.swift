//
//  AddHydroBillVC.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin on 06/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

protocol AddHydroBillVCDelegate : class {
    func hydActionTrigger(str: String, field: String)
}

class AddHydroBillVC: UIViewController {

    // MARK: - Properties
    weak var delegate: AddHydroBillVCDelegate?
            
    @IBOutlet var providerView: UIView!
    @IBOutlet var provider_tf: UITextField!
            
    @IBOutlet var unitsView: UIView!
    @IBOutlet var units_tf: UITextField!
            
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
extension AddHydroBillVC: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {

        //
        var txt_field = String()
        if textField == provider_tf {
            txt_field = "provider"
        }else {
            txt_field = "units"
        }
        self.delegate?.hydActionTrigger(str: textField.text!, field: "")
    }

}

