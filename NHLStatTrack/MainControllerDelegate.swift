//
//  MainControllerDelegate.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-03-22.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import UIKit

@objc
protocol  MainControllerDelegate {
    @objc optional func toggleDrawer()
    @objc optional func collapseDrawer()
}
