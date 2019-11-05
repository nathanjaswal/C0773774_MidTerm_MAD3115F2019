//
//  CustomerDetailTVC.swift
//  C0773774_MidTerm_MAD3115F2019
//
//  Created by Nitin on 04/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class CustomerDetailTVC: UITableViewCell {
    // MARK: - Properties
    @IBOutlet var containView: UIView!
    @IBOutlet var innerView: UIView!
    @IBOutlet var day_lbl: UILabel!
    
    @IBOutlet var bill_lbl: UILabel!
    @IBOutlet var type_lbl: UILabel!
    
    @IBOutlet var upDown_img: UIImageView!
    @IBOutlet var descp_lbl: UILabel!
    @IBOutlet var desc_view: UIView!
    
    
    // MARK: -  Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        //
        desc_view.addShadow(view: desc_view, color: UIColor.hexStringToUIColor(hex: "6D67FD").cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.7, radius: 4)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Helper
    func setDisplay(str: String) {
        //
        //name_lbl.text = (customer.firstName ?? "") + " " + (customer.lastName ?? "")
        descp_lbl.text = str
    }

}
