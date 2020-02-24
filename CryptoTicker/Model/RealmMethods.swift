//
//  RealmHelper.swift
//  CryptoConverter
//
//  Created by Anuar on 11/18/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import Foundation
import RealmSwift

class RealmMethods {
    
    // MARK: - Realm database methods
    
    static func readData() -> [QuoteCached] {
        
        var cachedQuoteArray: [QuoteCached] = []
        do {
            let realm = try Realm()
            let results = realm.objects(QuoteCached.self)
            results
                .forEach { quote in
                    cachedQuoteArray.append(quote)
            }
        } catch {
            print("Error reading from Realm database: \(error)")
        }
        
        return cachedQuoteArray
    }
    
    static func queryData(query: String) -> [QuoteCached] {
        
        var queriedQuoteArray: [QuoteCached] = []
        
        if query == "" {
            return readData()
        }
        
        do {
            let realm = try Realm()
            let results = realm.objects(QuoteCached.self)
            let queryResults = results.filter("name CONTAINS[cd] %@ || symbol CONTAINS[cd] %@", query, query).sorted(byKeyPath: "rank", ascending: true)
            queryResults
                .forEach { quote in
                    queriedQuoteArray.append(quote)
                }
        } catch {
            print("Error reading from Realm database: \(error)")
        }
        
        return queriedQuoteArray
    }
    
    static func saveData(quotes: [Quote]) {
        
        do {
            let realm = try Realm()
            try realm.write {
                quotes
                .map { QuoteCached(quote: $0) }
                .forEach { quote in
                    realm.add(quote, update: .all)
                }
            }
        } catch {
            print("Error saving to Realm database: \(error)")
        }
    }
}
