//
//  UpcomingViewCell.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-04-01.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import UIKit

class UpcomingViewCell: UITableViewCell {
    @IBOutlet weak var awayImg: UIImageView!
    @IBOutlet weak var homeImg: UIImageView!
    @IBOutlet weak var awayName: UILabel!
    @IBOutlet weak var homeName: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    
    func configureGame(_ game:Game) {
        if game.awayImg.size.width > game.awayImg.size.height {
            awayImg.contentMode = UIViewContentMode.scaleAspectFit
        } else {
            awayImg.contentMode = UIViewContentMode.scaleAspectFill
        }
        
        if game.homeImg.size.width > game.homeImg.size.height {
            homeImg.contentMode = UIViewContentMode.scaleAspectFit
        } else {
            homeImg.contentMode = UIViewContentMode.scaleAspectFill
        }
        
        awayImg.image = game.awayImg
        homeImg.image = game.homeImg
        awayName.text = game.away
        homeName.text = game.home
        timeLbl.text = game.time
    }
}
