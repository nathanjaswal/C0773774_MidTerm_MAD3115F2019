//
//  CustomerDetail.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin on 03/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit


/// this is the class for showing customer detail and all the pending bill list.
class CustomerDetailVC: UIViewController {

    // MARK: - Properties
    var seleInd = -1
    
    @IBOutlet var currDate_lbl: UILabel!
    @IBOutlet var design_lblL: UILabel!
    @IBOutlet var design_lblR: UILabel!
    
    @IBOutlet var bill_tv: UITableView!
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action
 
    @IBAction func backBtnClicked(_ sender: Any) {
    }
    
    
    // MARK: - Helper
    func setupUI() {
        design_lblL.roundCorners(corners: [.bottomRight, .topRight], radius: 8.0)
        design_lblR.roundCorners(corners: [.bottomLeft, .topLeft], radius: 8.0)
    }
}

// MARK:- UITableViewDataSource
extension CustomerDetailVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10//Singelton.singObj.customerArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerDetailTVC", for: indexPath ) as! CustomerDetailTVC
//        //
//        let customerData = Singelton.singObj.customerArr[indexPath.row]
//        //
        if(indexPath.row % 2 == 0){
            cell.setDisplay(str: "guygiugiuhoiuhoihoihoihoihoihoihoihoihoihoihoihoihoiuhoihoihoihoihoihoihoihoihoihoihoihoihoihoihoihouhoiuhoiuhohoihoihoihoihoihoihoihoihoiguygiugiuhoiuhoihoihoihoihoihoihoihoihoihoihoihoihoiuhoihoihoihoihoihoihoihoihoihoihoihoihoihoihoihouhoiuhoiuhohoihoihoihoihoihoihoihoihoiguygiugiuhoiuhoihoihoihoihoihoihoihoihoihoihoihoihoiuhoihoihoihoihoihoihoihoihoihoihoihoihoihoihoihouhoiuhoiuhohoihoihoihoihoihoihoihoihoiguygiugiuhoiuhoihoihoihoihoihoihoihoihoihoihoihoihoiuhoihoihoihoihoihoihoihoihoihoihoihoihoihoihoihouhoiuhoiuhohoihoihoihoihoihoihoihoihoi")
        }else{
            cell.setDisplay(str: "guyihoiuhoih")
        }
        
        //
        cell.desc_view.isHidden = true
        if(seleInd == indexPath.row){
            cell.desc_view.isHidden = false
        }
        
        return cell
    }
    
}

// MARK:- UITableViewDelegate
extension CustomerDetailVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        if(seleInd == indexPath.row){
            return UITableView.automaticDimension//tableView.automatic
        }
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        tableView.deselectRow(at: indexPath, animated: true)
                
        let prevSlInd = seleInd
        seleInd = indexPath.row
        let indexPath = IndexPath(item: seleInd, section: 0)
        tableView.reloadRows(at: [indexPath], with: .none)
        
        if(prevSlInd >= 0){
            let indexPath = IndexPath(item: prevSlInd, section: 0)
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
   
}
