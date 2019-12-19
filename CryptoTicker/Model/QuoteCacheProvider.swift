//
//  QuoteCacheProvider.swift
//  CryptoTicker
//
//  Created by Anuar on 11/26/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import Foundation

class QuoteCacheProvider {
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(webQuotesHandler), name: Constants.sendWebQuotes, object: nil)
    }
    
    @objc func webQuotesHandler(_ notification: Notification) {
        
        if let webQuoteArray = notification.object as? [Quote] {
            RealmMethods.saveData(quotes: webQuoteArray)
            NotificationCenter.default.post(name: Constants.sendCacheQuotes, object: nil)
        }
        
    }
}
