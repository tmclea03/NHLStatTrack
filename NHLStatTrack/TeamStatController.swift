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
    
    var teamName = String("")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = teamName
        // Do any additional setup after loading the view.
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
