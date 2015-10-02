//
//  StudentCell.swift
//  DbDemoExampleSwift
//
//  Created by TheAppGuruz-New-6 on 11/08/15.
//  Copyright (c) 2015 TheAppGuruz-New-6. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {

    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
