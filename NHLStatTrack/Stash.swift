//
//  Stash.swift
//  NHLStatTrack
//
//  Created by Gregor Sharpe on 2018-03-31.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import Foundation

class Stash {
    
    // Time for a cached result to expire, in seconds.
    let cacheTimeout = 60 * 5
    
    let db = Cache()
    
    static var theStash: Stash?
    
    init() {
        if Stash.theStash == nil {
            Stash.theStash = self
            print("Stash Initialized!")
        }
    }
    
    func getInstance() -> Stash {
        return Stash.theStash!
    }
    
    func pullFromStash(url: String) -> String {
        //if url exists in database
        if db.endpointExists(endpointToCheck: url) {
            // If the endpoint's update time + the timeout is still less than the current time, recache the data.
            let endpointUpdateRecord = db.endpointLastUpdated(endpointToCheck: url)
            
            if ((endpointUpdateRecord == nil) || (endpointUpdateRecord!.addingTimeInterval(TimeInterval(cacheTimeout))) < Date()) {
                print("Endpoint expired! Fetching now.")
                // fetch url from internet
                let handler = APIRequest()
                handler.makeRequest(targetURL: url) { success in
                    if success {
                        self.db.addEndpoint(endpoint:url, data: handler.content)
                    }
                }
            }
        }
        else {
            print("Endpoint did not exist. Fetching now.")
            // fetch url from internet
            let handler = APIRequest()
            handler.makeRequest(targetURL: url) { success in
                if success {
                    self.db.addEndpoint(endpoint:url, data: handler.content)
                }
            }
        }
        // Pull endpoint, updated or not, from the cache.
        
        while (!db.endpointExists(endpointToCheck: url)) {
            sleep(1)
        }
        return db.pullEndpoint(endpointToPull: url)
    }
}
