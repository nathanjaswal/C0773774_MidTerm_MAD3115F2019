//
//  AddNewBillVC.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin on 06/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

/// this is the class to create new bill
class AddNewBillVC: UIViewController {

    // MARK:- Properties
    @IBOutlet var cancelBtn: UIButton!
    @IBOutlet var detailView: UIView!
    @IBOutlet var furtherDetailView: UIView!
    
    @IBOutlet var id_tf: UITextField!
    @IBOutlet var date_tf: UITextField!
    @IBOutlet var type_tf: UITextField!
    @IBOutlet var amount_tf: UITextField!
    
    
    
    // MARK:-  Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK:- Action
    @IBAction func cancelBtnClicked(_ sender: Any) {
    }
    
    @IBAction func doneBtnClicked(_ sender: Any) {
    }
    
    // MARK:- Helper
    

}
