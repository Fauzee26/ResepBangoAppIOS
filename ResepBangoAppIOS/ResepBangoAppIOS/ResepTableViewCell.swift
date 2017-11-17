//
//  ResepTableViewCell.swift
//  ResepBangoAppIOS
//
//  Created by Muhammad Hilmy Fauzi on 17/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class ResepTableViewCell: UITableViewCell {

    @IBOutlet weak var labelResep: UILabel!
    @IBOutlet weak var labelWaktu: UILabel!
    @IBOutlet weak var labelOrang: UILabel!
    @IBOutlet weak var labelHarga: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
