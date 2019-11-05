//
//  CustomerListTVC.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin Jaswal on 01/11/19.
//  Copyright © 2019 Nitin Jaswal. All rights reserved.
//

import UIKit

class CustomerListTVC: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet var contan_view: UIView!
    @IBOutlet var name_lbl: UILabel!
    @IBOutlet var email_lbl: UILabel!
    @IBOutlet var img_view: UIImageView!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        contan_view.addBorder(view: contan_view, radius: 8.0, width: 1, color: UIColor.lightGray.cgColor)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Helper
    func setDisplay(customer: CustomersVM) {
        //
        name_lbl.text = (customer.firstName ?? "") + " " + (customer.lastName ?? "")
        email_lbl.text = customer.email ?? ""
    }
    

}
