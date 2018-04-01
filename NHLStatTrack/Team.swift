//
//  Team.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-04-01.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import UIKit

struct Team {
    let name:String
    let gp:Int
    let win:Int
    let loss:Int
    let otLoss:Int
    let pts:Int
    
    init(name:String, gp:Int, win:Int, loss:Int, otLoss:Int, pts:Int) {
        self.name = name
        self.gp = gp
        self.win = win
        self.loss = loss
        self.otLoss = otLoss
        self.pts = pts
    }
}
