//
//  optionCells.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-03-22.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import UIKit

class OptionCell: UITableViewCell {
    
    @IBOutlet weak var optionImageView: UIImageView!
    @IBOutlet weak var optionLabel: UILabel!
    
    
    func configureForOption(_ option:Option) {
        optionImageView.image = option.image
        optionLabel.text = option.title
    }
}
