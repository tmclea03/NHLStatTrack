//
//  ViewController.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-03-22.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {

    enum SlideState {
        case leftExpanded
        case collapsed
    }
    
    var mainNavigationController: UINavigationController?
    var mainController:MainController!
    
    var currentState:SlideState = .collapsed {
        didSet {
            let shouldShowShadow = currentState != .collapsed
            //showShadowForMainController(shouldShowShadow)
        }
    }
    
    var drawerController:DrawerController?
    
    let centerPanelExpandOffset:CGFloat = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainController = UIStoryboard.mainController()
        mainController.viewDelegate = self
        
        mainNavigationController = UINavigationController(rootViewController: mainController)
        view.addSubview(mainNavigationController.view)
        addChildViewController(mainNavigationController)
        
    mainNavigationController?.didMove(toParentViewController: self)
        
        let panGesture = UIPanGestureRecognizer()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

private extension UIStoryboard {
    static func main()->UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func drawerController()->DrawerController? {
        return main().instantiateViewController(withIdentifier: "DrawerController") as? DrawerController
    }
    
    static func mainController()->MainController? {
        return main().instantiateViewController(withIdentifier: "MainController") as? MainController
    }
}

