//
//  Player.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-04-01.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import UIKit

struct Player {
    let name:String
    let gp:Int
    let goals:Int
    let assists:Int
    let points:Int
    let plusMinus:Int
    let pim:Int
    
    init(name:String, gp:Int, goals:Int, assists:Int, points:Int, plusMinus:Int, pim:Int) {
        self.name = name
        self.gp = gp
        self.goals = goals
        self.assists = assists
        self.points = points
        self.plusMinus = plusMinus
        self.pim = pim
    }
}
