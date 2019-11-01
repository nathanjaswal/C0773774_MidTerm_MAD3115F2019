//
//  ViewController.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Apple on 31/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

/// This is the signin class
class SignInVC: UIViewController {
    
    // MARK: - Properties
    @IBOutlet var upConta_view: UIView!
    @IBOutlet var inConta_view: UIView!
    @IBOutlet var userN_view: UIView!
    @IBOutlet var passwd_view: UIView!
    @IBOutlet var remembBtn: UIButton!
    @IBOutlet var signInBtn: UIButton!
    @IBOutlet var userN_tf: UITextField!
    @IBOutlet var passwd_tf: UITextField!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        setUpUI()
        
        //
        initSetup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //
        self.view.endEditing(true)
        
        //
        initSetup()
    }
    
    // MARK: - Action
    @IBAction func userNHintBtnClicked(_ sender: Any) {
        self.showAlert(title: "User Name:", message: "nitin")
    }
    
    @IBAction func passwdHintBtnClicked(_ sender: Any) {
        self.showAlert(title: "Password:", message: "c0773774")
    }
    
    @IBAction func rememberBtnClicked(_ sender: UIButton) {
        if sender.isSelected == false {
            sender.isSelected = true
        }else{
            sender.isSelected = false
        }
    }
    
    @IBAction func signInBtnClicked(_ sender: Any) {
        //
        if remembBtn.isSelected == true {
            
            UserDefaults.standard.set(userN_tf.text, forKey: "user_name")
            UserDefaults.standard.set(passwd_tf.text, forKey: "password")
        }else{
            if let appDomain = Bundle.main.bundleIdentifier {
                UserDefaults.standard.removePersistentDomain(forName: appDomain)
             }
        }
        
        // check validation
        if self.checkTextFields() {
            
            // check plist
            let boolChk = self.readDataInfoFromPlistFile().0
            let msg = self.readDataInfoFromPlistFile().1
            if boolChk {
                //
                self.navigateScreen(storyboard: "Home", controller: "CustomerListVC")
            }else{
                self.showAlert(title: "Nitin Jaswal", message: msg)
            }
        }
        
    }
    
    // MARK: - Helper
    func initSetup(){
        //
        if let userName = UserDefaults.standard.string(forKey: "user_name"), let passwd = UserDefaults.standard.string(forKey: "password") {
            //
            remembBtn.isSelected = true
            
            userN_tf.text = userName
            passwd_tf.text = passwd
        }else{
            // reset values
            userN_tf.text = ""
            passwd_tf.text = ""
        }
    }
    
    func setUpUI() {
        //
        userN_view.addBorder(view: userN_view, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
        passwd_view.addBorder(view: passwd_view, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
        signInBtn.addBorder(view: signInBtn, radius: 7.0, width: 1, color: UIColor.lightGray.cgColor)
        //
        upConta_view.addShadow(view: upConta_view, color: UIColor.hexStringToUIColor(hex: "6D67FD").cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.8, radius: 5)
        inConta_view.addShadow(view: inConta_view, color: UIColor.lightGray.cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.4, radius: 5)
        signInBtn.addShadow(view: signInBtn, color: UIColor.hexStringToUIColor(hex: "6D67FD").cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.8, radius: 5)
        
    }
    
    func checkTextFields() -> Bool {
        
        if userN_tf.text == "" {
            self.showAlert(title: "Nitin Jaswal", message: "Username required.")
            return false
        }
        if passwd_tf.text == "" {
            self.showAlert(title: "Nitin Jaswal", message: "Password required.")
            return false
        }
        
        return true
    }
    
    func readDataInfoFromPlistFile() -> (Bool, String) {
        
        if let plist = Bundle.main.path(forResource: "DataInfo", ofType: "plist")
           {
               if let dict = NSDictionary(contentsOfFile: plist)
               {
                   //Reading the users
                   if let users = dict["appUsers"] as? [[String: String]]
                   {
                        //
                        var strMsg = String()
                        for user in users
                        {
                           
                            let userName = user["username"]!
                            let passwd = user["password"]!
                            
                            // match entered data
                            if(userName != userN_tf.text){
                                strMsg = "Wrong Username"
                            }else if(userName == userN_tf.text && passwd != passwd_tf.text){
                                strMsg = "Wrong Password"
                            }else if(userName == userN_tf.text && passwd == passwd_tf.text) {
                                strMsg = ""
                                return (true, "")
                            }
                        }
                    
                        //
                        return (false, strMsg)
                   }
                  
               }
           }
        
           return (false, "Invalid information, check again.")
           
    }
    

}

