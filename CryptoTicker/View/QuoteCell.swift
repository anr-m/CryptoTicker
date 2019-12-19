//
//  QuoteCell.swift
//  CryptoConverter
//
//  Created by Anuar on 11/2/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import UIKit
import SwipeCellKit

class QuoteCell: SwipeTableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var lastUpdatedLabel: UILabel!
    @IBOutlet weak var percentChangeLabel: UILabel!
    @IBOutlet weak var statLabel: UILabel!
    
    func configure(with quote: QuoteCached) {
        
        if let priceUSD = Double(quote.priceUSD) {
           self.priceLabel.text = "$\(String(format: "%.2f", priceUSD))"
        } else {
            self.priceLabel.text = "$----"
        }
        
        self.statLabel.text? = "Market Cap: $\(Formatter.numberFormatter(quote.marketCapUSD))\n"
        self.statLabel.text?.append("Volume(24h): $\(Formatter.numberFormatter(quote.volumeUSD24h))\n")
        self.statLabel.text?.append("Available: \(Formatter.numberFormatter(quote.availableSupply)) \(quote.symbol)")
        self.lastUpdatedLabel.text = Formatter.dateFormatter(quote.lastUpdated)
        
        if let percentChange = Double(quote.percentChange1h) {
            self.percentChangeLabel.text = "\(String(format: "%.2f", percentChange))%"
            self.percentChangeLabel.textColor = percentChange >= 0 ? .green : .red
        } else {
            self.percentChangeLabel.text = "0.00%"
            self.percentChangeLabel.textColor = .blue
        }
    }
}
