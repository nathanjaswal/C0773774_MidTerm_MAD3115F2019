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
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.minimumDate = Date()
        return picker
    }()
    
    lazy var billTypePicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    let kInternetChildH = 195.00
    let kMobileChildH = 250.00
    let kHydroChildH = 150.00
    let kInsuranceChildH = 250.00
    
    var addInternetVC = AddInternetBillVC()
    var addMobileVC = AddMobileBillVC()
    var addHydroVC = AddHydroBillVC()
    var addInsuranceVC = AddInsuranceBillVC()
    
    @IBOutlet var idView: UIView!
    @IBOutlet var dateView: UIView!
    @IBOutlet var typeView: UIView!
    @IBOutlet var amountView: UIView!
    
    @IBOutlet var cancelBtn: UIButton!
    @IBOutlet var detailView: UIView!
    @IBOutlet var furtherDetailView: UIView!
    @IBOutlet var furtherDetailViewHeight: NSLayoutConstraint!
    
    @IBOutlet var id_tf: UITextField!
    @IBOutlet var date_tf: UITextField!
    @IBOutlet var type_tf: UITextField!
    @IBOutlet var amount_tf: UITextField!
    
    
    // MARK:-  Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //
        setUpUI()
        
        //
        initSetup()
    }
    

    // MARK:- Action
    @IBAction func cancelBtnClicked(_ sender: Any) {
        //
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneBtnClicked(_ sender: Any) {
        //
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK:- Helper
    func setUpUI() {
        //
        cancelBtn.addBorder(view: cancelBtn, radius: 8.0, width: 1, color: UIColor.hexStringToUIColor(hex: "6D67FD").cgColor)
        //
        detailView.addShadow(view: detailView, color: UIColor.white.cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.8, radius: 5)
        furtherDetailView.addShadow(view: furtherDetailView, color: UIColor.white.cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.4, radius: 5)
    
    }
    
    func initSetup() {
        //
        idView.addBorder(view: idView, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
        dateView.addBorder(view: dateView, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
        typeView.addBorder(view: typeView, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
        amountView.addBorder(view: amountView, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
        
        
        //
        date_tf.inputView = datePicker
        billTypePicker.delegate = self
        billTypePicker.dataSource = self
        type_tf.inputView = billTypePicker
        
        furtherDetailViewHeight.constant = 0.0
    }
    
    func setupFurtherDetailView(type: BillType) {
        switch type {
        case BillType.internet:
            furtherDetailViewHeight.constant = CGFloat(kInternetChildH)
            
            //
            self.view.layoutIfNeeded()
            
            //
             addInternetVC.willMove(toParent: nil)
             addInternetVC.view.removeFromSuperview()
             addInternetVC.removeFromParent()

             //
             addInternetVC = UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "AddInternetBillVC") as! AddInternetBillVC
            
             addInternetVC.delegate = self
             addInternetVC.view.frame = CGRect(x: 15, y: 15, width: Int(self.view.frame.size.width - 30.00), height: Int(kInternetChildH))
             
             self.addChild(addInternetVC)
             self.furtherDetailView.addSubview(addInternetVC.view)
             addInternetVC.didMove(toParent: self)
            
        case BillType.mobile:
            furtherDetailViewHeight.constant = CGFloat(kMobileChildH)
            
        case BillType.hydro:
            furtherDetailViewHeight.constant = CGFloat(kHydroChildH)
            
        case BillType.insurance:
            furtherDetailViewHeight.constant = CGFloat(kInsuranceChildH)
        
        }
    }
}

extension AddNewBillVC: UITextFieldDelegate {
    
    // MARK:- TextField Delegates
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == date_tf {
            textField.text = datePicker.date.toString()
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == type_tf {
            textField.text = BillType.allCases[0].rawValue
        }
    }
}

/*
 Manage Bill type picker
 */
typealias BillTypePicker = AddNewBillVC
extension BillTypePicker: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return BillType.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return BillType.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        type_tf.text = BillType.allCases[row].rawValue
        
        //
        setupFurtherDetailView(type: BillType.allCases[row])
        
    }
}

// MARK: - OfflineDelegate
extension AddNewBillVC: AddInternetBillVCDelegate {
    
    func intrActionTrigger(str: String) {
        print(str)
    }
}
