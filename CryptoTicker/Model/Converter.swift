//
//  Converter.swift
//  CryptoConverter
//
//  Created by Anuar on 10/29/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import Foundation

class Converter {
    
    var baseQuote: QuoteCached?
    
    func currencyConverter(convertQuote: QuoteCached, amount: Double) -> Double {
        
        guard let baseQuote = baseQuote else {
            return Double()
        }
        
        guard let baseQuotePrice = Double(baseQuote.priceUSD) else {
            return Double()
        }
        
        guard let convertQuotePrice = Double(convertQuote.priceUSD) else {
            return Double()
        }
        
        return (amount * baseQuotePrice)/convertQuotePrice
    }
}
