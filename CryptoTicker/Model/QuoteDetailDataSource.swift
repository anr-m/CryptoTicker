//
//  Detail.swift
//  CryptoConverter
//
//  Created by Anuar on 11/3/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import Foundation

class QuoteDetailDataSource {

    private init() {
        
    }
    
    static func provideQuoteDetails(with quote: QuoteCached) -> [(String, [String])]{
        
        var max_supply = "No info"
        
        if let quoteMaxSupply = quote.maxSupply {
            max_supply = "\(Formatter.numberFormatter(quoteMaxSupply)) \(quote.symbol)"
        }
        
        let quoteDetails = [
            ("API Info",
                ["ID: \(quote.id)",
                "Rank: \(quote.rank)",
                "Last updated: \(Formatter.dateFormatter(quote.lastUpdated))"]
            ),
            
            ("Price",
                ["\(quote.priceUSD) USD",
                "\(quote.priceBTC) BTC"]
            ),
            
            ("Percent change",
             ["Last hour: \(quote.percentChange1h)%",
                "Last day: \(quote.percentChange24h)%",
                "Last week: \(quote.percentChange7d)%"]
            ),
            
            ("Market Stats",
             ["Volume (24h): $\(Formatter.numberFormatter(quote.volumeUSD24h))",
                "Market Cap: $\(Formatter.numberFormatter(quote.marketCapUSD))"]
            ),
            
            ("Supply Stats",
             ["Available supply: \(Formatter.numberFormatter(quote.availableSupply)) \(quote.symbol)",
                "Total supply: \(Formatter.numberFormatter(quote.totalSupply)) \(quote.symbol)",
                "Maximum supply: \(max_supply)"]
            )
        ]
        
        return quoteDetails
    }
}
