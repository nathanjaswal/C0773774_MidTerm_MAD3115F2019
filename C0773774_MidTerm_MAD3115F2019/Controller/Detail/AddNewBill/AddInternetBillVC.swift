//
//  AddInternetBillVC.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin on 06/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

protocol AddInternetBillVCDelegate : class {
    func intrActionTrigger(str: String)
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
    }
   
}

 // MARK: - UITextFieldDelegates
extension AddInternetBillVC: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        //
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
        
        //
        self.delegate?.intrActionTrigger(str: textField.text!)
    }

}
