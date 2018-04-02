//
//  ViewController.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-03-27.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import UIKit

class StandingController: UITableViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var teams:Array<Array<Team>>!
    
    enum CellID {
        static let TeamViewCell = "TeamCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        teams = APIGlue().getStandings()
        
        createMenus()
        customizeBar()
        populateStandings()
        
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createMenus() {
        if revealViewController() != nil {
            menuButton.target = 	revealViewController()
            menuButton.action = #selector	(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 	(UIScreen.main.bounds.width / 5) * 2
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func customizeBar() {
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor(red: 31/255, green: 31/255, blue: 31/255, alpha: 1)
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        NSLog("Encoding Standing")
        super.encodeRestorableState(with: coder)
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        NSLog("Decoding Standing")
        super.decodeRestorableState(with: coder)
    }
    
    override func applicationFinishedRestoringState() {
        super.applicationFinishedRestoringState()
    }
    
    func populateStandings() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 8
        case 1:
            return 8
        case 2:
            return 7
        case 3:
            return 8
        default:
            return 0
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: CellID.TeamViewCell, for: indexPath) as! TeamViewCell
        if (indexPath.row < teams[indexPath.section].count) {
            cell.configureForTeam(teams[indexPath.section][indexPath.row])
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Atlantic                                 GP   W   L   OTL PTS"
        case 1:
            return "Metropolitan                       GP   W   L   OTL PTS"
        case 2:
            return "Central                                  GP   W   L   OTL PTS"
        case 3:
            return "Pacific                                   GP   W   L   OTL PTS"
        default:
            return ""
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
