//
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

    // MARK: - Properties
    var customer_id = Int()
    var bill_type: BillType?
    
    // Internet Properties
    var bill_nameIn: String?
    var bill_dataIn: String?
    
    // Mobile Properties
    var bill_nameMo: String?
    var bill_planMo: String?
    var bill_phoneNoMo: String?
    var bill_dataMo: String?
    var bill_minutesMo: String?

    // Hydro Properties
    var bill_nameHy: String?
    var bill_unitsHy: String?
    
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
    let kMobileChildH = 395.00
    let kHydroChildH = 195.00
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
        if (bill_type != nil) {
            if checkTextFields(type: bill_type!) {
                let customers = Singelton.singObj.customerArr
                for i in 0..<customers.count {
                    let customer = customers[i]
                    if customer.id == customer_id {
      
                        // creating bill...
                        let bill = BillM(id: id_tf.text!, date: date_tf.text!, type: type_tf.text!, amount: Float(amount_tf.text!), nameIn: bill_nameIn ?? "", dataIn: Float(bill_dataIn ?? "0.00"), nameMo: bill_nameMo ?? "", planMo: bill_planMo ?? "", phoneNoMo: bill_phoneNoMo ?? "", dataMo: Float(bill_dataMo ?? "0.00"), minutesMo: bill_minutesMo ?? "", nameHy: bill_nameHy ?? "", unitsHy: Float(bill_unitsHy ?? "0.00"))
                        var previousBills = customer.bills
                        previousBills?.append(bill)
                        
                        // update customer
                        let updateCustomer = CustomersM(id: customer.id, firstName: customer.firstName, lastName: customer.lastName, email: customer.email, bills: previousBills!)
                        
                        Singelton.singObj.customerArr.remove(at: i)
                        Singelton.singObj.customerArr.insert(CustomersVM(customer: updateCustomer), at: i)
                        //Singelton.singObj.customerArr.append()
                        
                         NotificationCenter.default.post(name: Notification.Name("customerDetailVCRefresh"), object: nil)
                        
                        //
                        doneCompleted()
                    }
                }
            }
        }
       
        
        //self.dismiss(animated: true, completion: nil)
    }
    
    // MARK:- Helper
    
    func doneCompleted() {
        //
        let alertController = UIAlertController(title: "NJ", message: "Bill Successfully Created.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive) {
            UIAlertAction in
            
            //
             self.dismiss(animated: true, completion: nil)
            
        }
        
        // Add the actions
        alertController.addAction(okAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
    
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
        
        //
        furtherDetailViewHeight.constant = 0.0
    }
    
    func checkTextFields(type: BillType) -> Bool {
    
        if id_tf.text == "" {
            self.showAlert(title: "NJ", message: "Bill Id is required.")
            return false
        }
        if date_tf.text == "" {
            self.showAlert(title: "NJ", message: "Bill date is required.")
            return false
        }
        if type_tf.text == "" {
            self.showAlert(title: "NJ", message: "Bill type is required.")
            return false
        }
        if amount_tf.text == "" {
            self.showAlert(title: "NJ", message: "Bill amount is required.")
            return false
        }
        
        switch type {
            case BillType.internet:
                if bill_nameIn == "" {
                    self.showAlert(title: "NJ", message: "Provider Name is required.")
                    return false
                }
                if bill_dataIn == "" {
                    self.showAlert(title: "NJ", message: "Data Usage is required.")
                    return false
                }
            case BillType.mobile:
                if bill_nameMo == "" {
                    self.showAlert(title: "NJ", message: "Provider Name is required.")
                    return false
                }
                if bill_planMo == "" {
                    self.showAlert(title: "NJ", message: "Plan selected is required.")
                    return false
                }
                if bill_phoneNoMo == "" {
                    self.showAlert(title: "NJ", message: "Phone Number is required.")
                    return false
                }
                if bill_phoneNoMo!.count > 10 {
                    self.showAlert(title: "NJ", message: "Phone Number length should be less than 10 character.")
                    return false
                }
                if bill_dataMo == "" {
                    self.showAlert(title: "NJ", message: "Dtae is required.")
                    return false
                }
                if bill_minutesMo == "" {
                    self.showAlert(title: "NJ", message: "Minutes Usage is required.")
                    return false
                }
            case BillType.hydro:
                if bill_nameHy == "" {
                    self.showAlert(title: "NJ", message: "Provider Name is required.")
                    return false
                }
                if bill_unitsHy == "" {
                    self.showAlert(title: "NJ", message: "Units is required.")
                    return false
                }
//            case BillType.insurance:
//                break
        }
        
       
        
        return true
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
            
            //
            self.view.layoutIfNeeded()
            
            //
             addMobileVC.willMove(toParent: nil)
             addMobileVC.view.removeFromSuperview()
             addMobileVC.removeFromParent()

             //
             addMobileVC = UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "AddMobileBillVC") as! AddMobileBillVC
            
             addMobileVC.delegate = self
             addMobileVC.view.frame = CGRect(x: 15, y: 15, width: Int(self.view.frame.size.width - 30.00), height: Int(kMobileChildH))
             
             self.addChild(addMobileVC)
             self.furtherDetailView.addSubview(addMobileVC.view)
             addMobileVC.didMove(toParent: self)
            
        case BillType.hydro:
            furtherDetailViewHeight.constant = CGFloat(kHydroChildH)
                        
            //
            self.view.layoutIfNeeded()
            
            //
             addHydroVC.willMove(toParent: nil)
             addHydroVC.view.removeFromSuperview()
             addHydroVC.removeFromParent()

             //
             addHydroVC = UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "AddHydroBillVC") as! AddHydroBillVC
            
             addHydroVC.delegate = self
             addHydroVC.view.frame = CGRect(x: 15, y: 15, width: Int(self.view.frame.size.width - 30.00), height: Int(kHydroChildH))
             
             self.addChild(addHydroVC)
             self.furtherDetailView.addSubview(addHydroVC.view)
             addHydroVC.didMove(toParent: self)
            
//        case BillType.insurance:
//            furtherDetailViewHeight.constant = CGFloat(kInsuranceChildH)
        
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
}

// MARK: - UIPickerViewDelegate && UIPickerViewDataSource
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
        bill_type = BillType.allCases[row]
        type_tf.text = BillType.allCases[row].rawValue
        
        //
        setupFurtherDetailView(type: BillType.allCases[row])
        
    }
}

// MARK: - OfflineDelegate
extension AddNewBillVC: AddInternetBillVCDelegate {
    
    func intrActionTrigger(str: String, field: String) {
        switch field {
        case "provider":
            bill_nameIn = str
            break
        case "data":
            bill_dataIn = str
            break
        default:
            break
        }
    }
}

// MARK: - OfflineDelegate
extension AddNewBillVC: AddMobileBillVCDelegate {
    
    func moActionTrigger(str: String, field: String) {
        switch field {
        case "provider":
            bill_nameMo = str
            break
        case "plan":
            bill_planMo = str
            break
        case "phoneno":
            bill_phoneNoMo = str
            break
        case "data":
            bill_dataMo = str
            break
        case "minutes":
            bill_minutesMo = str
            break
        default:
            break
        }
    }
}

// MARK: - OfflineDelegate
extension AddNewBillVC: AddHydroBillVCDelegate {
    
    func hydActionTrigger(str: String, field: String) {
        switch field {
        case "provider":
            bill_nameHy = str
            break
        case "units":
            bill_unitsHy = str
            break
        default:
            break
        }
    }
}

