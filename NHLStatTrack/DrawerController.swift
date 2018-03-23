//
//  DrawerController.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-03-22.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import UIKit

class DrawerController: UIViewController {
    
    var delegate:DrawerControllerDelegate?
    var options:Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension DrawerController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Options", for: IndexPath) as! String
        return cell
    }
    
}
