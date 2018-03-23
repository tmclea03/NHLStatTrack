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
            Option(title: "Live", image:UIImage(named:"")), //SCORES
            Option(title: "Standings", image:UIImage(named:"")), //TEAMS
            Option(title: "Teams", image:UIImage(named:"")), //STANDINGS
            Option(title: "", image:UIImage(named:"")), //LIVE
        ]
    }
}
