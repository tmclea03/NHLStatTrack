//
//  TeamController.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-03-27.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import UIKit

class TeamController: UIViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createMenus()
        customizeBar()
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
