//
//  Option.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-03-22.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import UIKit

struct Option {
    let title:String
    let image:UIImage?
    
    init(title:String, image:UIImage?) {
        self.title = title
        self.image = image
    }
    
    static func allOpts()->[Option] {
        return [
            Option(title: "Live", image:UIImage(named:"live.png")), //SCORES
            Option(title: "Standings", image:UIImage(named:"cup.png")), //TEAMS
            Option(title: "Teams", image:UIImage(named:"jersey.png")), //STANDINGS
            Option(title: "Schedule", image:UIImage(named:"calendar.png")), //LIVE
        ]
    }
}
