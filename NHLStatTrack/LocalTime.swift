//
//  LocalTime.swift
//  NHLStatTrack
//
//  Created by Tyler McLean on 2018-04-01.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import Foundation

class LocalTime:NSObject {
    func toLocal(time:String)->String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        let sourceDate = dateFormatter.date(from: "2018-04-02T23:00:00Z")
        
        if (sourceDate == nil) {
            print("Source Date is nil")
        }
        
        let sourceZone = NSTimeZone.init(abbreviation: "GMT")
        let destZone = NSTimeZone.system
        
        let sourceOffset = sourceZone?.secondsFromGMT(for: sourceDate!)
        let destOffset = destZone.secondsFromGMT(for: sourceDate!)
        let interval = destOffset - sourceOffset!
        
        let destDate = Date.init(timeInterval: TimeInterval(interval), since: sourceDate!)
        
        let localFormatter = DateFormatter()
        localFormatter.timeZone = NSTimeZone.system
        localFormatter.dateFormat = "M/d/yy 'at' h:mma"
        
        let localTime = localFormatter.string(from: destDate)
        
        return localTime
    }
}
