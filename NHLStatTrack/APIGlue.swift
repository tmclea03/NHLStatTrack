//
//  APIGlue.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-04-01.
//  Copyright © 2018 UofG Students. All rights reserved.
//

class APIGlue {
    func getStandings() -> Array<Array<Team>>! {
        let stache = Stash().getInstance()
        var standings = Array<Array<Team>>()
        standings.append(Array<Team>())
        standings.append(Array<Team>())
        standings.append(Array<Team>())
        standings.append(Array<Team>())
        
        let pullData = stache.pullFromStash(url: "https://statsapi.web.nhl.com/api/v1/standings")
        let parser = JsonParser()
        
        let json = parser.parseJson(toParse: pullData)
        
        let standingBase = json["records"] as! Array<AnyObject>
        
        for division in standingBase {
            let record = division["teamRecords"] as! Array<AnyObject>
            for teams in record {
                let teamsDict = teams as! Dictionary<String, AnyObject>
                let divisionName = division["division"] as! Dictionary<String, AnyObject>
                
                let team = Team(name: teamsDict["team"]!["name"] as! String, gp: teamsDict["gamesPlayed"] as! Int, win: teamsDict["leagueRecord"]!["wins"] as! Int, loss: teamsDict["leagueRecord"]!["losses"] as! Int, otLoss: teamsDict["leagueRecord"]!["ot"] as! Int, pts: teamsDict["points"] as! Int)
                
                if (divisionName["name"] as! String == "Atlantic") {
                    standings[0].append(team)
                } else if (divisionName["name"] as! String == "Metropolitan") {
                    standings[1].append(team)
                } else if (divisionName["name"] as! String == "Central") {
                    standings[2].append(team)
                } else if (divisionName["name"] as! String == "Pacific") {
                    standings[3].append(team)
                }
            }
        }
        
        return standings
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
            var statBase = Dictionary<String, AnyObject>()
            var hasStats = true
            
            if (((playerBase["stats"] as! Array<AnyObject>)[0]["splits"] as! Array<AnyObject>).count > 0) {
                statBase = ((playerBase["stats"] as! Array<AnyObject>)[0]["splits"] as! Array<AnyObject>)[0]["stat"] as! Dictionary<String, AnyObject>
            } else {
                hasStats = false
            }
            
            if (playerBase["primaryPosition"]!["code"] as! String != "G") {
                if (hasStats) {
                    newPlayer = Player(name: playerBase["fullName"] as! String, gp: statBase["games"] as! Int, goals: statBase["goals"] as! Int, assists: statBase["assists"] as! Int, points: statBase["points"] as! Int, plusMinus: statBase["plusMinus"] as! Int, pim: statBase["pim"] as! Int)
                } else {
                    newPlayer = Player(name: playerBase["fullName"] as! String, gp: 0, goals: 0, assists: 0, points: 0, plusMinus: 0, pim: 0)
                }
            } else {
                if (hasStats) {
                    newPlayer = Player(name: playerBase["fullName"] as! String, gp: statBase["games"] as! Int, goals: 0, assists: 0, points: 0, plusMinus: 0, pim: 0)
                } else {
                    newPlayer = Player(name: playerBase["fullName"] as! String, gp: 0, goals: 0, assists: 0, points: 0, plusMinus: 0, pim: 0)
                }
            }
            
            players.append(newPlayer)
        }
        
        return players
    }
    
    func getUpcoming() -> Array<Game>! {
        let stache = Stash().getInstance()
        var gamesList = Array<Game>()
        
        let currDate = Date()
        let futureDate = Date().addingTimeInterval(60*60*24*7)
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd"
        
        let currDateString = formatter.string(from: currDate)
        let futureDateString = formatter.string(from: futureDate)
        
        let pullData = stache.pullFromStash(url: "https://statsapi.web.nhl.com/api/v1/schedule?startDate=\(currDateString)&endDate=\(futureDateString)&expand=schedule.teams")
        let parser = JsonParser()
        
        let json = parser.parseJson(toParse: pullData)
        
        let dateBase = json["dates"] as! Array<AnyObject>
        
        for date in dateBase {
            let games = date["games"] as! Array<AnyObject>
            
            for game in games {
                let gameDict = game as! Dictionary<String, AnyObject>
                var newGame = Game(home: (((gameDict["teams"] as! Dictionary<String, AnyObject>)["home"] as! Dictionary<String, AnyObject>)["team"] as! Dictionary<String, AnyObject>)["name"] as! String, away: (((gameDict["teams"] as! Dictionary<String, AnyObject>)["away"] as! Dictionary<String, AnyObject>)["team"] as! Dictionary<String, AnyObject>)["name"] as! String, time: LocalTime().toLocal(time: gameDict["gameDate"] as! String))
                
                gamesList.append(newGame)
                
            }
        }
        
        return gamesList
    }
}
