//
//  QuoteTableViewController+RefreshTableData.swift
//  CryptoTicker
//
//  Created by Anuar on 11/26/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import UIKit
import SwiftySound
import AnimatableReload

extension QuoteTableViewController {
    
    // MARK: - Refresh Table Data
    
    @objc func refreshTableData(_ notification: Notification) {
        
        DispatchQueue.main.async {
            
            self.updatedQuoteArray = RealmMethods.readData()
            
            self.tableView.reloadData()
            self.searchBar.resignFirstResponder()
            self.searchBar.text = ""
            
            if self.tabBarController?.selectedIndex == 0 && self.navigationController?.topViewController is QuoteTableViewController {
                Sound.play(file: Constants.cash, fileExtension: "wav", numberOfLoops: 0)
                AnimatableReload.reload(tableView: self.tableView, animationDirection: "right")
            }
            
            self.tableView.endAllRefreshing()
        }
    }
}
