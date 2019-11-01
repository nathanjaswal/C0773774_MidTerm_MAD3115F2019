//
//  AddCustomerVC.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin Jaswal on 31/10/19.
//  Copyright © 2019 Nitin Jaswal. All rights reserved.
//

import UIKit

/// This is the class to add new customer
class AddCustomerVC: UIViewController {

    // MARK: - Properties
    @IBOutlet var contan_view: UIView!
    @IBOutlet var fNameInn_view: UIView!
    @IBOutlet var lNameInn_view: UIView!
    @IBOutlet var emailInn_view: UIView!
    
    @IBOutlet var fName_tf: UITextField!
    @IBOutlet var lName_tf: UITextField!
    @IBOutlet var email_tf: UITextField!
    
    @IBOutlet var cancelBtn: UIButton!
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        setUpUI()

    }
    
    // MARK: - Action
    @IBAction func cancelBtnClicked(_ sender: Any) {
        //
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneBtnClicked(_ sender: Any) {
        //
    }

    // MARK: - Helper
    func setUpUI() {
        //
        fNameInn_view.addBorder(view: fNameInn_view, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
        lNameInn_view.addBorder(view: lNameInn_view, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
        emailInn_view.addBorder(view: emailInn_view, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
        //
        contan_view.addShadow(view: contan_view, color: UIColor.hexStringToUIColor(hex: "6D67FD").cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.8, radius: 5)
        
        
    }
    
    func checkTextFields() -> Bool {
        
        if fName_tf.text == "" {
            self.showAlert(title: "NJ", message: "First Name is required.")
            return false
        }
        if lName_tf.text == "" {
            self.showAlert(title: "NJ", message: "Last Name is required.")
            return false
        }
        if email_tf.text == "" {
            self.showAlert(title: "NJ", message: "E-mail address is required.")
            return false
        }
        
        return true
    }
    
   
}
