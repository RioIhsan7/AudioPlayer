//
//  MurotalTableViewCell.swift
//  Audio Player
//
//  Created by Rio_Ihsan on 9/22/17.
//  Copyright © 2017 mac os. All rights reserved.
//

import UIKit

class MurotalTableViewCell: UITableViewCell {

    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
