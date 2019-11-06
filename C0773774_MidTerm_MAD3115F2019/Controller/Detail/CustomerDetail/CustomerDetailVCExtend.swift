//
//  CustomerDetailHelper.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin on 05/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//


import UIKit
import Foundation

// MARK:- UITableViewDataSource
extension CustomerDetailVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return billsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerDetailTVC", for: indexPath ) as! CustomerDetailTVC

        //
        cell.setDisplay(bill: (billsList?[indexPath.row])!)
        
        //
        cell.desc_view.isHidden = true
        cell.upDown_img.image = UIImage(named: "downIcon")
        if(seleInd == indexPath.row){
            cell.desc_view.isHidden = false
            cell.upDown_img.image = UIImage(named: "upIcon")
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
