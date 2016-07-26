//
//  myTableViewCell.swift
//  CoreDataWithTable
//
//  Created by wealthyjalloh on 26/07/2016.
//  Copyright © 2016 CWJ. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {
    
    // outlet
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
