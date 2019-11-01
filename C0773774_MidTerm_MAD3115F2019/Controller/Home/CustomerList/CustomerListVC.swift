//
//  CustomerListVC.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Apple on 31/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class CustomerListVC: UIViewController {

    // MARK:- Properties
    @IBOutlet var top_view: UIView!
    @IBOutlet var custmList_tv: UITableView!
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK:- Action
    @IBAction func moreBtnClicked(_ sender: Any) {
        //
        let alertController = UIAlertController(title: "Nitin Jaswal", message: "Do You want to Sign Out?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive) {
            UIAlertAction in
            
            //
            self.navigationController?.popToRootViewController(animated: true)
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
       
    }
    
    @IBAction func addBtnClicked(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddCustomerVC")
    }
    
    // MARK: - Helper
    func initSetup(){
        //
        
        
    }
    
    func setUpUI() {
        //
        top_view.addShadow(view: top_view, color: UIColor.hexStringToUIColor(hex: "6D67FD").cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.5, radius: 5)
        
        
    }
    
}

// MARK:- UITableViewDataSource
extension CustomerListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countryArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = cTableView.dequeueReusableCell(withIdentifier: "CGCountryTableViewCell", for: indexPath ) as! CGCountryTableViewCell
        //
        let country = countryArr[indexPath.row] as? String ?? ""
        cell.title_lbl.text = country
        
        //
        if(selecCountry == country) {
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
}

// MARK:- UITableViewDelegate
extension CustomerListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        tableView.deselectRowAtIndexPath(index, animated: true)
        
        //
        
        
    }
}
