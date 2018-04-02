//
//  APIRequest.swift
//  NHLStatTrack
//
//  Created by Gregor Sharpe on 2018-03-30.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import Foundation

class APIRequest {
    var content: String
    
    private func jsonToString(json: AnyObject) -> String? {
        do {
            let data1 = try JSONSerialization.data(withJSONObject: json)
            let convertedString = String(data: data1, encoding: String.Encoding.utf8)
            return(convertedString!)
        } catch let myJSONError {
            print(myJSONError)
            return nil
        }
    }
    
    init() {
        content = String()
    }
    
    // Sets up and runs a URLSession to get the contents of a provided URL.
    func makeRequest(targetURL: String, completion: ((Bool) -> (Void))?) {
        var request = URLRequest(url: URL(string: targetURL)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data2, response, error in
            //self.content = String(data: data2!, encoding: String.Encoding.utf8)!
            //completion?(true)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data2!) as AnyObject// as! Dictionary<String, AnyObject>
                let jsonAsString: String = self.jsonToString(json: json)!
                
                //print((json2["teams"]!)[0]!)
                //print(jsonAsString)
                self.content = jsonAsString
                
                completion?(true)
            } catch {
                print("Could not serialize JSON!")
            }
            
            
            
        })
        task.resume()
        
        
    }
}
