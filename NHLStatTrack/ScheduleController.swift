//
//  ScheduleController.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-03-27.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import UIKit

class ScheduleController: UITableViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var games:Array<Game>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        games = Array<Game>()
        
        games.append(Game.init(home: "HOME", away: "AWAY", time: "04/02/18\n7:30PM"))
        
        createMenus()
        customizeBar()
        
        self.tableView.reloadData()
        
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
        NSLog("Encoding Schedule")
        super.encodeRestorableState(with: coder)
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        NSLog("Decoding Standing")
        super.decodeRestorableState(with: coder)
    }

    override func applicationFinishedRestoringState() {
        super.applicationFinishedRestoringState()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "UpcomingCell", for: indexPath) as! UpcomingViewCell
        
        if (indexPath.row < games.count) {
            cell.configureGame(games[indexPath.row])
        }
        
        return cell
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
