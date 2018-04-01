//
//  Cache.swift
//  NHLStatTrack
//
//  Created by Gregor Sharpe on 2018-03-31.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import Foundation
import SQLite3

class Cache {
    
    // Set name of the cache table for use in the rest of the functions.
    let tableName = "cachedEndpoints"
    
    
    private var endpointUpdateRecord = [String: Date]()
    
    // Create SQLITE Database File.
    let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("CachedEndpoints.sqlite")
    
    var db: OpaquePointer?
    
    init() {
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Error opening database.")
        }
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS \(tableName) (id INTEGER PRIMARY KEY AUTOINCREMENT, endpoint TEXT, data TEXT)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("Error creating table:  \(errmsg)")
        }
    }
    
    func addEndpoint(endpoint: String, data: String) {
        var stmt: OpaquePointer?
        
        let queryString = "INSERT INTO \(tableName) (endpoint, data) VALUES (?,?)"
        
        // Create query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("Error preparing insert: \(errmsg)")
            return
        }
        
        // Bind parameters
        if sqlite3_bind_text(stmt, 1, endpoint, -1, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("Failure to bind endpoint to insert query: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 2, data, -1, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("Failure to bind data to insert query: \(errmsg)")
            return
        }
        
        // Execute insert
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("Failure inserting endpoint: \(errmsg)")
            return
        }
        
        endpointUpdateRecord[endpoint] = Date()
        
        print("Endpoint added successfully.")
    }
    
    private func _pullEndpoint(url: String) -> OpaquePointer? {
        let queryString = "SELECT * FROM \(tableName) WHERE endpoint LIKE '" + url + "\'"
        var stmt: OpaquePointer?
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("Error preparing read select: \(errmsg)")
            return nil
        }
        
        while(sqlite3_step(stmt) == SQLITE_ROW) {
            return (stmt)
        }
        
        return nil
    }
    
    func pullEndpoint(endpointToPull: String) -> String {
        let stmt = _pullEndpoint(url: endpointToPull)
        if stmt == nil {
            print("No matching endpoints could be found!")
            return ""
        }
        //let id = sqlite3_column_int(stmt, 0)
        let endpoint = String(cString: sqlite3_column_text(stmt, 1))
        print(endpoint)
        let data = String(cString: sqlite3_column_text(stmt, 2))
        return data
        
    }
    
    func endpointExists(endpointToCheck: String) -> Bool {
        if _pullEndpoint(url: endpointToCheck) != nil {
            return true
        }
        return false
    }
    
    // Deletes table and resets the sqlite_sequence.
    func purge() {
        var stmt: OpaquePointer?
        var queryString = "DELETE FROM \(tableName)"
        
        // Create query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("Error preparing delete: \(errmsg)")
            return
        }
        
        // Execute delete
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("Failure purging table: \(errmsg)")
            return
        }
        
        queryString = "DELETE FROM sqlite_sequence WHERE name='\(tableName)'"
        
        // Create query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("Error preparing delete: \(errmsg)")
            return
        }
        
        // Execute delete
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("Failure purging table: \(errmsg)")
            return
        }
        
        print("Table purged.")
    }
    
    func endpointLastUpdated(endpointToCheck: String) -> Date? {
        let data = endpointUpdateRecord[endpointToCheck]
        if data != nil {
            return data
        }
        return nil
    }
}
