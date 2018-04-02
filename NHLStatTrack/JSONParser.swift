//
//  JSONParser.swift
//  NHLStatTrack
//
//  Created by Gregor Sharpe on 2018-04-01.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import Foundation

class JsonParser {
    func parseJson(toParse: String) -> Dictionary<String, AnyObject> {
        do {

            //print(toParse)
            let json = try JSONSerialization.jsonObject(with: toParse.data(using: .utf8)!) as! Dictionary<String, AnyObject>
            //print(json)
            return json
            
        } catch let test {
            print(test)
            print("Could not serialize JSON!")
            
            return [String: AnyObject]()
        }
    }
}

/*do {
 let json = try JSONSerialization.jsonObject(with: data!) as!
 self.content = json
 //print(json)
 completion?(true)
 } catch {
 print("Could not serialize JSON!")
 }*/
