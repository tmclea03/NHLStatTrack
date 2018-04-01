//
//  APIRequest.swift
//  NHLStatTrack
//
//  Created by Gregor Sharpe on 2018-03-30.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import Foundation

class APIRequest {
    var content: String = ""
    
    private func jsonToString(json: AnyObject) -> String {
        do {
            let data1 = try JSONSerialization.data(withJSONObject: json)
            let convertedString = String(data: data1, encoding: String.Encoding.utf8)
            return convertedString!
        }
        catch let myJSONError {
            print(myJSONError)
        }
        return ""
    }
    
    func makeRequest(targetURL: String, completion: ((Bool) -> (Void))?) {
        var request = URLRequest(url: URL(string: targetURL)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data2, response, error in
            
            /*do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                self.content = json
                //print(json)
                completion?(true)
            } catch {
                print("Could not serialize JSON!")
            }*/
            
            self.content = String(data: data2!, encoding: String.Encoding.utf8)!
            completion?(true)
        })
        task.resume()
    }
}
