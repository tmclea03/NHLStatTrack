//
//  SWRevealViewController.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-03-27.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import UIKit

class SWRevealViewController: UIViewController {

    private func statusBarUdjustment(view:UIView) -> CGFloat {
        var adjustment = CGFloat(floatLiteral: 0.0)
        let app = UIApplication.shared
        let viewFrame = view.convert(view.bounds, to: app.keyWindow)
        let statusBarFrame = app.statusBarFrame
        
        if (viewFrame.intersects(statusBarFrame)) {
            adjustment = CGFloat(fminf(Float(statusBarFrame.width), Float(statusBarFrame.height)))
        }
        
        return adjustment
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
