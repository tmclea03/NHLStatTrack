//
//  DrawerController.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-03-22.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import UIKit

class DrawerController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var options:Array<Option>!
    
    enum CellIdentifiers {
        static let OptionCell = "OptionCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

// MARK: Table View Data Source

/*extension DrawerController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.OptionCell, for: indexPath) as! OptionCell
        cell.configureForOption(options[indexPath.row])
        return cell
    }
    
}*/

// MARK: Table View Delegate

/*extension DrawerController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}*/
