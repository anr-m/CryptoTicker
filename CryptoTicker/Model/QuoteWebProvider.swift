//
//  QuoteProvider.swift
//  CryptoConverter
//
//  Created by Anuar on 11/2/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import Foundation

class QuoteWebProvider {
    
    private var quoteArray: [Quote] = []
    private let address = "https://api.coinmarketcap.com/v1/ticker"
    
    var timer: Timer?
    
    init() {
        self.restartTimer()
    }
    
    private func sendNotification() {
        NotificationCenter.default.post(name: Constants.sendWebQuotes, object: quoteArray)
    }
    
    func restartTimer(timerInterval: Double = 300.0) {
        loadQuotes()
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { timer in
            self.loadQuotes()
        }
    }
    
    @objc func loadQuotes() {
    
        guard let url = URL(string: address) else {
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) {
            [weak self]
            (data, response, error) in
            if let data = data {
                if let quotes = try? JSONDecoder().decode([Quote].self, from: data) {
                    self?.quoteArray = quotes
                    self?.sendNotification()
                }
            }
        }
        dataTask.resume()
    }
}
