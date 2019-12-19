//
//  QuoteTableViewContoller+DataSource.swift
//  CryptoTicker
//
//  Created by Anuar on 11/25/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import UIKit

extension QuoteTableViewController {
    
    // MARK: - Table view data source methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return updatedQuoteArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.quoteCell, for: indexPath) as? QuoteCell else {
            return UITableViewCell()
        }
        
        cell.delegate = self
        
        cell.configure(with: updatedQuoteArray[indexPath.section])
        
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let quoteHeaderView = Bundle.main.loadNibNamed(Constants.quoteHeader, owner: self, options: nil)?.first as? QuoteHeader else {
            return UIView()
        }
        
        quoteHeaderView.configure(with: updatedQuoteArray[section])
        
        return quoteHeaderView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.quoteHeaderHeight
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.quoteRowHeight
    }
}
