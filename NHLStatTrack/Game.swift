//
//  Game.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-04-01.
//  Copyright © 2018 UofG Students. All rights reserved.
//

struct Game {
    let home:String
    let away:String
    let time:String
    let homeImg:UIImage
    let awayImg:UIImage
    
    init(home:String, away:String, time:String) {
        self.home = home
        self.away = away
        self.time = time
        self.homeImg = UIImage(named: "Avalanche@40px")!
        self.awayImg = UIImage(named: "Jets@40px")!
    }
}
