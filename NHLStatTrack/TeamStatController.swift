//
//  TeamStatController.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-03-31.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import UIKit

class TeamStatController: UIViewController {
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var lossLabel: UILabel!
    @IBOutlet weak var otLossLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var playerList: UITableView!
    
    var teamName = String("")
    var teamId = 0
    var players:Array<Player>!
    
    enum CellID {
        static let PlayerViewCell = "PlayerCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.playerList.delegate = self
        self.playerList.dataSource = self
        
        let teamStats = APIGlue().getTeam(from:teamId)!

        winLabel.text = String(describing: teamStats.win)
        lossLabel.text = String(describing: teamStats.loss)
        otLossLabel.text = String(describing: teamStats.otLoss)
        pointsLabel.text = String(describing: teamStats.pts)
        
        players = APIGlue().getRoster(teamId: teamId)
        
        self.title = teamName
        
        var image:UIImage
        
        image = UIImage()
        
        print("Team name: \(teamName)")
        
        if (teamName == "Ducks") {
            image = UIImage(named: "Ducks@128px")!
        }
        if (teamName == "Coyotes") {
            image = UIImage(named: "Coyotes@128px")!
        }
        if (teamName == "Bruins") {
           image = UIImage(named: "Bruins@128px")!
        }
        if (teamName == "Sabres") {
            image = UIImage(named: "Sabers@128px")!
        }
        if (teamName == "Flames") {
           image = UIImage(named: "Flames@128px")!
        }
        if (teamName == "Hurricanes") {
            image = UIImage(named: "Hurricanes@128px")!
        }
        if (teamName == "Blackhawks") {
            image = UIImage(named: "Blackhawks@128px")!
        }
        if (teamName == "Avalanche") {
            image = UIImage(named: "Avalanche@128px")!
        }
        if (teamName == "Blue Jackets") {
            image = UIImage(named: "Jackets@128px")!
        }
        if (teamName == "Stars") {
            image = UIImage(named: "Stars@128px")!
        }
        if (teamName == "Red Wings") {
            image = UIImage(named: "Wings@128px")!
        }
        if (teamName == "Oilers") {
            image = UIImage(named: "Oilers@128px")!
        }
        if (teamName == "Panthers") {
            image = UIImage(named: "Panthers@128px")!
        }
        if (teamName == "Kings") {
            image = UIImage(named: "Kings@128px")!
        }
        if (teamName == "Wild") {
            image = UIImage(named: "Wild@128px")!
        }
        if (teamName == "Canadians") {
            image = UIImage(named: "Canadians@128px")!
        }
        if (teamName == "Predators") {
            image = UIImage(named: "Predators@128px")!
        }
        if (teamName == "Devils") {
            image = UIImage(named: "Devils@128px")!
        }
        if (teamName == "Islanders") {
            image = UIImage(named: "Islanders@128px")!
        }
        if (teamName == "Rangers") {
           image = UIImage(named: "Rangers@128px")!
        }
        if (teamName == "Senators") {
            image = UIImage(named: "Senators@128px")!
        }
        if (teamName == "Flyers") {
            image = UIImage(named: "Flyers@128px")!
        }
        if (teamName == "Penguins") {
            image = UIImage(named: "Penguins@128px")!
        }
        if (teamName == "Sharks") {
            image = UIImage(named: "Sharks@128px")!
        }
        if (teamName == "Blues") {
            image = UIImage(named: "Blues@128px")!
        }
        if (teamName == "Lightning") {
            image = UIImage(named: "Lightning@128px")!
        }
        if (teamName == "Maple Leafs") {
            image = UIImage(named: "Leafs@128px")!
        }
        if (teamName == "Canucks") {
            image = UIImage(named: "Canucks@128px")!
        }
        if (teamName == "Golden Knights") {
            image = UIImage(named: "Knights@128px")!
        }
        if (teamName == "Capitals") {
            image = UIImage(named: "Capitals@128px")!
        }
        if (teamName == "Jets") {
            image = UIImage(named: "Jets@128px")!
        }
        
        if image.size.width > image.size.height {
            teamImage.contentMode = UIViewContentMode.scaleAspectFit
        } else {
            teamImage.contentMode = UIViewContentMode.scaleAspectFill
        }
        
        teamImage.image = image
        
        teamImage.setNeedsDisplay()
        
        playerList.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

// MARK: Table View Data Source
extension TeamStatController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playerList.dequeueReusableCell(withIdentifier: CellID.PlayerViewCell, for: indexPath) as! PlayerViewCell
        cell.configureForPlayer(players[indexPath.row])
        return cell
    }
    
    
}

extension TeamStatController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

