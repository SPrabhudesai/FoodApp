//
//  RecommandedTableViewCell.swift
//  RestroantApp
//
//  Created by shailesh on 21/08/18.
//  Copyright © 2018 Shailesh. All rights reserved.
//

import UIKit

class RecommandedTableViewCell: UITableViewCell {

    @IBOutlet var recommandedList: RecommandedList!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
