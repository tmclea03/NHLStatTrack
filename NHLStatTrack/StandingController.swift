//
//  ViewController.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-03-27.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import UIKit

class StandingController: UIViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var atlanticTeams: UITextView!
    @IBOutlet weak var metroTeams: UITextView!
    @IBOutlet weak var centralTeams: UITextView!
    @IBOutlet weak var pacificTeams: UITextView!
    
    @IBOutlet weak var atlanticGP: UITextView!
    @IBOutlet weak var atlanticW: UITextView!
    @IBOutlet weak var atlanticL: UITextView!
    @IBOutlet weak var atlanticOT: UITextView!
    @IBOutlet weak var atlanticPTS: UITextView!
    
    @IBOutlet weak var metroGP: UITextView!
    @IBOutlet weak var metroW: UITextView!
    @IBOutlet weak var metroL: UITextView!
    @IBOutlet weak var metroOT: UITextView!
    @IBOutlet weak var metroPTS: UITextView!
    
    @IBOutlet weak var centralGP: UITextView!
    @IBOutlet weak var centralW: UITextView!
    @IBOutlet weak var centralL: UITextView!
    @IBOutlet weak var centralOT: UITextView!
    @IBOutlet weak var centralPTS: UITextView!
    
    @IBOutlet weak var pacificGP: UITextView!
    @IBOutlet weak var pacificW: UITextView!
    @IBOutlet weak var pacificL: UITextView!
    @IBOutlet weak var pacificOT: UITextView!
    @IBOutlet weak var pacificPTS: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createMenus()
        customizeBar()
        populateStandings()
        
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
        atlanticTeams.text = "    Lightning\n\n"
        atlanticTeams.text.append("    Bruins\n\n");
        atlanticTeams.text.append("    Maple Leafs\n\n");
        atlanticTeams.text.append("    Panthers\n\n");
        atlanticTeams.text.append("    Red Wings\n\n");
        atlanticTeams.text.append("    Canadians\n\n");
        atlanticTeams.text.append("    Senators\n\n");
        atlanticTeams.text.append("    Sabers\n\n");
        atlanticGP.text = "78\n\n76\n\n78\n\n76\n\n78\n\n77\n\n77\n\n77"
        atlanticW.text = "52\n\n48\n\n47\n\n39\n\n29\n\n28\n\n27\n\n24"
        atlanticL.text = "22\n\n17\n\n24\n\n29\n\n38\n\n37\n\n39\n\n41"
        atlanticOT.text = "4\n\n11\n\n7\n\n8\n\n11\n\n12\n\n11\n\n12"
        atlanticPTS.text = "108\n\n107\n\n101\n\n86\n\n69\n\n68\n\n65\n\n60"
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
