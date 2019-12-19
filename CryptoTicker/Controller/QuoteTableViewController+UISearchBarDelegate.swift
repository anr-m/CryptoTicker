//
//  UISearchBarDelegate.swift
//  CryptoTicker
//
//  Created by Anuar on 11/25/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import UIKit

// MARK: - UISearchBarDelegate methods

extension QuoteTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        DispatchQueue.main.async {
            searchBar.resignFirstResponder()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        updatedQuoteArray = RealmMethods.queryData(query: searchBar.text ?? "")
        tableView.reloadData()
    }
    
}
