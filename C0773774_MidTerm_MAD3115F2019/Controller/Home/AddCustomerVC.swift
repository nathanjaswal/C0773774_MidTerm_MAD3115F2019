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
        // check validation
        if self.checkTextFields() {
            
            //
            let boolChk = self.emailAlready().0
            let newId = self.emailAlready().1
            if boolChk {
                //
                let newCustomer = CustomersM(id: (newId + 1), firstName: fName_tf.text, lastName: lName_tf.text, email: email_tf.text)//, internet: nil, mobile: nil, hydro: nil)//
                
                Singelton.singObj.customerArr.append(CustomersVM(customer: newCustomer))
                
                self.dismiss(animated: true, completion: nil)
            }else{
                self.showAlert(title: "NJ", message: "E-mail address already used")
            }
        }
    }

    // MARK: - Helper
    func setUpUI() {
        //
        fNameInn_view.addBorder(view: fNameInn_view, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
        lNameInn_view.addBorder(view: lNameInn_view, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
        emailInn_view.addBorder(view: emailInn_view, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
        
        cancelBtn.addBorder(view: cancelBtn, radius: 8.0, width: 1, color: UIColor.hexStringToUIColor(hex: "6D67FD").cgColor)
        //
        contan_view.addShadow(view: contan_view, color: UIColor.white.cgColor, offset: CGSize(width: -4, height: 4), opacity: 0.8, radius: 20)
        
        
    }
    
    //
    func checkTextFields() -> Bool {
        //
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
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,10}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        if emailTest.evaluate(with: email_tf.text) == false {
            self.showAlert(title: "NJ", message: "Please Enter Valid Email Address..!!!")
            return false
        }
        
        return true
    }
    
    //
    func emailAlready() -> (Bool, Int) {
        var id = Int()
        
        let custArr = Singelton.singObj.customerArr
        // check if email exists or not...
        for customer in custArr {
            if email_tf.text == customer.email {
                return (false, 0)
            }
            
            id = customer.id ?? 0
        }
        
        return (true, id)
    }
    
   
}
