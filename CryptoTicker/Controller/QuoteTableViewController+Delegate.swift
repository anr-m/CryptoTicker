//
//  QuoteTableViewController+Delegate.swift
//  CryptoTicker
//
//  Created by Anuar on 11/25/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import UIKit
import SwiftySound

extension QuoteTableViewController {
    
    // MARK: - TableView Delegate methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        Sound.play(file: Constants.click, fileExtension: "wav", numberOfLoops: 0)
        
        if isSelectMode {
            if isBaseQuoteSelectMode {
                NotificationCenter.default.post(name: Constants.sendBaseQuote, object: updatedQuoteArray[indexPath.section])
            } else {
                NotificationCenter.default.post(name: Constants.sendConvertQuote, object: updatedQuoteArray[indexPath.section])
            }
            
            dismiss(animated: true, completion: nil)
            isBaseQuoteSelectMode = false
            isSelectMode = false
        } else {
            performSegue(withIdentifier: Constants.toQuoteDetailSegue, sender: updatedQuoteArray[indexPath.section])
        }
    }
}
