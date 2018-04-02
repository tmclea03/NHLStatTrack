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
    
    let pictureLocations =
        ["Anaheim Ducks":"Ducks@40px",
         "Arizona Coyotes":"Coyotes@40px",
         "Boston Bruins":"Bruins@40px",
         "Buffalo Sabres":"Sabers@40px",
         "Calgary Flames":"Flames@40px",
         "Carolina Hurricanes":"Hurricanes@40px",
         "Chicago Blackhawks":"Blackhawks@40px",
         "Colorado Avalanche":"Avalanche@40px",
         "Columbus Blue Jackets":"Jackets@40px",
         "Dallas Stars":"Stars@40px",
         "Detroit Red Wings":"Wings@40px",
         "Edmonton Oilers":"Oilers@40px",
         "Florida Panthers":"Panthers@40px",
         "Los Angeles Kings":"Kings@40px",
         "Minnesota Wild":"Wild@40px",
         "Montréal Canadiens":"Canadians@40px",
         "Nashville Predators":"Predators@40px",
         "New Jersey Devils":"Devils@40px",
         "New York Islanders":"Islanders@40px",
         "New York Rangers":"Rangers@40px",
         "Ottawa Senators":"Senators@40px",
         "Philadelphia Flyers":"Flyers@40px",
         "Pittsburgh Penguins":"Penguins@40px",
         "San Jose Sharks":"Sharks@40px",
         "St. Louis Blues":"Blues@40px",
         "Tampa Bay Lightning":"Lightning@40px",
         "Toronto Maple Leafs":"Leafs@40px",
         "Vancouver Canucks":"Canucks@40px",
         "Vegas Golden Knights":"Knights@40px",
         "Washington Capitals":"Capitals@40px",
         "Winnipeg Jets":"Jets@40px"]
    
    init(home:String, away:String, time:String) {
        self.home = home
        self.away = away
        self.time = time
        self.homeImg = UIImage(named: pictureLocations[home]!)!
        self.awayImg = UIImage(named: pictureLocations[away]!)!
    }
}
