//
//  MeetingCell.swift
//  Meetings
//
//  Created by Aakash Sinha on 14/06/20.
//  Copyright © 2020 Aakash Sinha. All rights reserved.
//

import UIKit

class MeetingCell: UITableViewCell {
    
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
