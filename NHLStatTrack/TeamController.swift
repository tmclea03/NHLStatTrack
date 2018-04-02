//
//  TeamController.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-03-27.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import UIKit

class TeamController: UITableViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createMenus()
        customizeBar()
        /*/-------------------------------------------------------------------------------------------
        
        let stash = Stash().getInstance()
        stash.db.purge()
        
        let pulledData = stash.pullFromStash(url: "http://statsapi.web.nhl.com/api/v1/teams")
        let parser = JsonParser()
        let json = parser.parseJson(toParse: pulledData)
        print((json["teams"]!)[0]!)
        
        //print(json!["copyright"]!)
        
        //-------------------------------------------------------------------------------------------*/
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createMenus() {
        if revealViewController() != nil {
            menuButton.target =     revealViewController()
            menuButton.action = #selector    (SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth =     (UIScreen.main.bounds.width / 5) * 2
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func customizeBar() {
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor(red: 31/255, green: 31/255, blue: 31/255, alpha: 1)
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        NSLog("Encoding Team")
        super.encodeRestorableState(with: coder)
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        NSLog("Decoding Team")
        super.decodeRestorableState(with: coder)
    }
    
    override func applicationFinishedRestoringState() {
        super.applicationFinishedRestoringState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "anaheim") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Ducks"
            controller.teamId = 24
        }
        if (segue.identifier == "arizona") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Coyotes"
            controller.teamId = 53
        }
        if (segue.identifier == "boston") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Bruins"
            controller.teamId = 6
        }
        if (segue.identifier == "buffalo") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Sabres"
            controller.teamId = 7
        }
        if (segue.identifier == "calgary") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Flames"
            controller.teamId = 20
        }
        if (segue.identifier == "carolina") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Hurricanes"
            controller.teamId = 12
        }
        if (segue.identifier == "chicago") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Blackhawks"
            controller.teamId = 16
        }
        if (segue.identifier == "colorado") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Avalanche"
            controller.teamId = 21
        }
        if (segue.identifier == "columbus") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Blue Jackets"
            controller.teamId = 29
        }
        if (segue.identifier == "dallas") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Stars"
            controller.teamId = 25
        }
        if (segue.identifier == "detroit") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Red Wings"
            controller.teamId = 17
        }
        if (segue.identifier == "edmonton") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Oilers"
            controller.teamId = 22
        }
        if (segue.identifier == "florida") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Panthers"
            controller.teamId = 13
        }
        if (segue.identifier == "losAngeles") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Kings"
            controller.teamId = 26
        }
        if (segue.identifier == "minnesota") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Wild"
            controller.teamId = 30
        }
        if (segue.identifier == "montreal") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Canadians"
            controller.teamId = 8
        }
        if (segue.identifier == "nashville") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Predators"
            controller.teamId = 18
        }
        if (segue.identifier == "newJersey") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Devils"
            controller.teamId = 1
        }
        if (segue.identifier == "nyIslanders") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Islanders"
            controller.teamId = 2
        }
        if (segue.identifier == "nyRangers") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Rangers"
            controller.teamId = 3
        }
        if (segue.identifier == "ottawa") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Senators"
            controller.teamId = 9
        }
        if (segue.identifier == "philadelphia") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Flyers"
            controller.teamId = 4
        }
        if (segue.identifier == "pittsburgh") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Penguins"
            controller.teamId = 5
        }
        if (segue.identifier == "sanJose") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Sharks"
            controller.teamId = 28
        }
        if (segue.identifier == "stLouis") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Blues"
            controller.teamId = 19
        }
        if (segue.identifier == "tampa") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Lightning"
            controller.teamId = 14
        }
        if (segue.identifier == "toronto") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Maple Leafs"
            controller.teamId = 10
        }
        if (segue.identifier == "vancouver") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Canucks"
            controller.teamId = 23
        }
        if (segue.identifier == "vegas") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Golden Knights"
            controller.teamId = 54
        }
        if (segue.identifier == "washington") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Capitals"
            controller.teamId = 15
        }
        if (segue.identifier == "winnepeg") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Jets"
            controller.teamId = 52
        }
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
