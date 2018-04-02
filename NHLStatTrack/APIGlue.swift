//
//  APIGlue.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-04-01.
//  Copyright © 2018 UofG Students. All rights reserved.
//

class APIGlue {
    func getStandings() -> Array<Array<Team>>! {
        
        return nil
    }
    
    public func getTeam(from id:Int) -> Team! {
        let stache = Stash().getInstance()
        
        let pullData = stache.pullFromStash(url: "https://statsapi.web.nhl.com/api/v1/teams/\(id)?expand=team.stats")
        let parser = JsonParser()
        
        let json = parser.parseJson(toParse: pullData)
        
        var teamBase = ((((((json["teams"] as! Array<AnyObject>)[0]["teamStats"]) as! Array<AnyObject>)[0]["splits"]) as! Array<AnyObject>)[0]["stat"]) as! Dictionary<String, AnyObject>
        
        let returnTeam = Team(name: ((json["teams"] as! Array<AnyObject>)[0] as! Dictionary<String, AnyObject>)["name"] as! String, gp: teamBase["gamesPlayed"] as! Int, win: teamBase["wins"] as! Int, loss: teamBase["losses"] as! Int, otLoss: teamBase["ot"] as! Int, pts: teamBase["pts"] as! Int)
        
        return returnTeam
    }
    
    func getRoster(teamId:Int) -> Array<Player>! {
        let stache = Stash().getInstance()
        var players = Array<Player>()
        
        let pullData = stache.pullFromStash(url: "http://statsapi.web.nhl.com/api/v1/teams/\(teamId)?hydrate=roster(person(stats(splits=statsSingleSeason)))")
        let parser = JsonParser()
        
        let json = parser.parseJson(toParse: pullData)
        
        let rosterBase = (((((json["teams"] as! Array<AnyObject>)[0]["roster"]) as! Dictionary<String, AnyObject>)["roster"]) as! Array<AnyObject>)
        
        for player in rosterBase {
            var newPlayer:Player
            var playerBase = player["person"] as! Dictionary<String, AnyObject>
            var statBase = ((playerBase["stats"] as! Array<AnyObject>)[0]["splits"] as! Array<AnyObject>)[0]["stat"] as! Dictionary<String, AnyObject>
            
            print(playerBase["fullName"] as! String)
            print(statBase["games"] as! Int)
            
            if (playerBase["primaryPosition"]!["code"] as! String != "G") {
                newPlayer = Player(name: playerBase["fullName"] as! String, gp: statBase["games"] as! Int, goals: statBase["goals"] as! Int, assists: statBase["assists"] as! Int, points: statBase["points"] as! Int, plusMinus: statBase["plusMinus"] as! Int, pim: statBase["pim"] as! Int)
            } else {
                newPlayer = Player(name: playerBase["fullName"] as! String, gp: statBase["games"] as! Int, goals: 0, assists: 0, points: 0, plusMinus: 0, pim: 0)
            }
            
            players.append(newPlayer)
        }
        
        return players
    }
    
    func getUpcoming() -> Array<Game>! {
        
        return nil
    }
}
