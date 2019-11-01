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
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
