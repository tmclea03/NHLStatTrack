//
//  PlayerViewCell.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-04-01.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import UIKit

class PlayerViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gp: UILabel!
    @IBOutlet weak var goal: UILabel!
    @IBOutlet weak var assist: UILabel!
    @IBOutlet weak var point: UILabel!
    @IBOutlet weak var plusMinus: UILabel!
    @IBOutlet weak var pim: UILabel!
    
    func configureForPlayer(_ player:Player) {
        name.text = player.name
        gp.text = "\(player.gp)"
        goal.text = "\(player.goals)"
        assist.text = "\(player.assists)"
        point.text = "\(player.points)"
        plusMinus.text = "\(player.plusMinus)"
        pim.text = "\(player.pim)"
    }

}
