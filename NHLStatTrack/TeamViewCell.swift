//
//  TeamViewCell.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-04-01.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import UIKit

class TeamViewCell: UITableViewCell {
    @IBOutlet weak var teamImg: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var gp: UILabel!
    @IBOutlet weak var wins: UILabel!
    @IBOutlet weak var losses: UILabel!
    @IBOutlet weak var otLosses: UILabel!
    @IBOutlet weak var pts: UILabel!
    
    func configureForTeam(_ team:Team) {
        teamName.text = team.name
        gp.text = "\(team.gp)"
        wins.text = "\(team.win)"
        losses.text = "\(team.loss)"
        otLosses.text = "\(team.otLoss)"
        pts.text = "\(team.pts)"
    }

}
