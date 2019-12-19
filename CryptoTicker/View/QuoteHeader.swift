//
//  QuoteHeader.swift
//  CryptoConverter
//
//  Created by Anuar on 11/2/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import UIKit

class QuoteHeader: UITableViewCell {

    @IBOutlet weak var quoteHeaderRankLabel: UILabel!
    @IBOutlet weak var quoteHeaderImage: UIImageView!
    @IBOutlet weak var quoteHeaderInfoLabel: UILabel!
    
    func configure(with quote: QuoteCached) {
        
        self.quoteHeaderRankLabel.text = "\(quote.rank)"
        self.quoteHeaderImage.image = UIImage(named: quote.id) ?? UIImage(named: "bitcoin")
        self.quoteHeaderInfoLabel.text = "\(quote.name) (\(quote.symbol))"
    }
}
