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
    
    // Holds an instance of stash as the master instance, allowing further instances to reference the master.
    static var theStash: Stash?
    
    init() {
        // Ensure the first instance is set as the master.
        if Stash.theStash == nil {
            Stash.theStash = self
            print("Stash Initialized!")
        }
    }
    
    // Allows slave instances of stash to get the master instance.
    func getInstance() -> Stash {
        return Stash.theStash!
    }
    
    // Abstracts all of the RESTful interaction and DB interaction away into a single call.
    // Utilizes the endpoint's last updated time and the db itself to determine if the requested
    // information can be pulled from the cache, or if the cache needs to be updated first.
    // Can cause small periods of UI hang when fetching new data.
    
    func pullFromStash(url: String) -> String {
        //if url exists in database
        if db.endpointExists(endpointToCheck: url) {
            // if the endpoint's update time + the timeout is still less than the current time, recache the data.
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
        // Pull endpoint, updated or not, from the cache while making sure it exists.
        while (!db.endpointExists(endpointToCheck: url)) {
            sleep(1)
        }
        let toReturn = db.pullEndpoint(endpointToPull: url)
        return(toReturn)
    }
}
