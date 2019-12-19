//
//  NavigationBarButtons.swift
//  CryptoTicker
//
//  Created by Anuar on 11/25/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import UIKit

extension QuoteTableViewController {
    
    @IBAction func refreshButtonPressed(_ sender: UIBarButtonItem) {
        
        if timerLabel.title == "10s" {
            quoteWebProvider?.restartTimer(timerInterval: 10.0)
        } else if timerLabel.title == "30s" {
            quoteWebProvider?.restartTimer(timerInterval: 30.0)
        } else if timerLabel.title == "1.5m" {
            quoteWebProvider?.restartTimer(timerInterval: 90.0)
        } else if timerLabel.title == "5m" {
            quoteWebProvider?.restartTimer()
        }
    }

    @IBAction func timerButtonPressed(_ sender: UIBarButtonItem) {
        
        if timerLabel.title == "5m" {
            quoteWebProvider?.restartTimer(timerInterval: 10.0)
            timerLabel.title = "10s"
        } else if timerLabel.title == "10s" {
            quoteWebProvider?.restartTimer(timerInterval: 30.0)
            timerLabel.title = "30s"
        } else if timerLabel.title == "30s" {
            quoteWebProvider?.restartTimer(timerInterval: 90.0)
            timerLabel.title = "1.5m"
        } else if timerLabel.title == "1.5m" {
            quoteWebProvider?.restartTimer()
            timerLabel.title = "5m"
        }
    }
}
