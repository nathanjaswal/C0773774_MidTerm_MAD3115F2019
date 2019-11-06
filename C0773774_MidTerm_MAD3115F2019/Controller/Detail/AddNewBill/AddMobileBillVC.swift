//
//  AddMobileBillVC.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin on 06/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

protocol AddMobileBillVCDelegate : class {
    func moActionTrigger(str: String)
}

class AddMobileBillVC: UIViewController {
    
    // MARK: - Properties
    weak var delegate: AddMobileBillVCDelegate?
    
    @IBOutlet var providerView: UIView!
    @IBOutlet var provider_tf: UITextField!
    
    @IBOutlet var unitsView: UIView!
    @IBOutlet var units_tf: UITextField!

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
        self.delegate?.moActionTrigger(str: textField.text!)
    }

}

