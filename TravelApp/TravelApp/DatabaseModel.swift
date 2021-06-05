//
//  DatabaseModel.swift
//  TravelApp
//
//  Created by Dzmitry Semenovich on 4.06.21.
//

import Foundation
import SQLite3

class Database {
    
    func openDatabase() -> OpaquePointer? {
        
        let fileURL = "/Users/adambokun/Documents/repos/labrabota10-gr1-travelapp/TravelApp/DB/airports.db"
        
        var db: OpaquePointer?
        guard sqlite3_open(fileURL, &db) == SQLITE_OK else {
            
            print("error opening database")
            sqlite3_close(db)
            db = nil
            
            return nil
        }
        
        return db
    }
    
    func getAirportCode(city: String) -> String {
        
        guard let db = openDatabase() else {
            return ""
        }
        
        let request = "SELECT * FROM Airports WHERE city = '\(city)'"
        
        var queryStatement: OpaquePointer? = nil
        
        var code = ""
        
        if sqlite3_prepare_v2(db, request, -1, &queryStatement, nil) == SQLITE_OK {
            
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                
                code = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                
            }
            
        } else {
            
            print("SELECT statement could not be prepared")
            
        }
        
        sqlite3_finalize(queryStatement)
        
        return code
        
    }
}

