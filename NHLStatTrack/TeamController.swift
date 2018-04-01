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
        //-------------------------------------------------------------------------------------------
        let test = APIRequest()
        test.makeRequest(targetURL:"http://httpbin.org/get") { success in
            if success {
                print(test.content)
            }
        }
        
        let db = Cache()
        db.purge()
        db.addEndpoint(endpoint: "/api/get", data: "And this is my data.")
        db.pullEndpoint(endpointToPull: "/api/get")
        
        
        //-------------------------------------------------------------------------------------------
        
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
        }
        if (segue.identifier == "arizona") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Coyotes"
        }
        if (segue.identifier == "boston") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Bruins"
        }
        if (segue.identifier == "buffalo") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Sabres"
        }
        if (segue.identifier == "calgary") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Flames"
        }
        if (segue.identifier == "carolina") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Hurricanes"
        }
        if (segue.identifier == "chicago") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Blackhawks"
        }
        if (segue.identifier == "colorado") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Avalanche"
        }
        if (segue.identifier == "columbus") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Blue Jackets"
        }
        if (segue.identifier == "dallas") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Stars"
        }
        if (segue.identifier == "detroit") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Red Wings"
        }
        if (segue.identifier == "edmonton") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Oilers"
        }
        if (segue.identifier == "florida") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Panthers"
        }
        if (segue.identifier == "losAngeles") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Kings"
        }
        if (segue.identifier == "minnesota") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Wild"
        }
        if (segue.identifier == "montreal") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Canadians"
        }
        if (segue.identifier == "nashville") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Predators"
        }
        if (segue.identifier == "newJersey") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Devils"
        }
        if (segue.identifier == "nyIslanders") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Islanders"
        }
        if (segue.identifier == "nyRangers") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Rangers"
        }
        if (segue.identifier == "ottawa") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Senators"
        }
        if (segue.identifier == "philadelphia") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Flyers"
        }
        if (segue.identifier == "pittsburgh") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Penguins"
        }
        if (segue.identifier == "sanJose") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Sharks"
        }
        if (segue.identifier == "stLouis") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Blues"
        }
        if (segue.identifier == "tampa") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Lightning"
        }
        if (segue.identifier == "toronto") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Maple Leafs"
        }
        if (segue.identifier == "vancouver") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Canucks"
        }
        if (segue.identifier == "vegas") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Golden Knights"
        }
        if (segue.identifier == "washington") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Capitals"
        }
        if (segue.identifier == "winnepeg") {
            let controller = segue.destination as! TeamStatController
            controller.teamName = "Jets"
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
