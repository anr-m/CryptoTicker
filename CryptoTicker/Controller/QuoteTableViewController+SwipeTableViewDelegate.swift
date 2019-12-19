//
//  SwipeTableViewDelegate.swift
//  CryptoTicker
//
//  Created by Anuar on 11/25/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import UIKit
import SwipeCellKit
import SwiftySound

// MARK: - SwipeTableViewDelegate methods

extension QuoteTableViewController: SwipeTableViewCellDelegate {

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        
        if orientation == .right && isSelectMode == false {
            
            let convertFromAction = SwipeAction(style: .default,
                                            title: "Convert from\n\(updatedQuoteArray[indexPath.section].symbol)") { (action, indexPath) in
                                                Sound.play(file: Constants.click, fileExtension: "wav", numberOfLoops: 0)
                                                self.tabBarController?.selectedIndex = 1
                                                NotificationCenter.default.post(name: Constants.sendBaseQuote, object: self.updatedQuoteArray[indexPath.section])
            }
            
            let convertToAction = SwipeAction(style: .destructive,
                                            title: "Convert to\n\(updatedQuoteArray[indexPath.section].symbol)") { (action, indexPath) in
                                                Sound.play(file: Constants.click, fileExtension: "wav", numberOfLoops: 0)
                                                self.tabBarController?.selectedIndex = 1
                                                NotificationCenter.default.post(name: Constants.sendConvertQuote, object: self.updatedQuoteArray[indexPath.section])
            }
            
            if #available(iOS 13.0, *) {
                convertFromAction.image = UIImage(systemName: "arrow.uturn.up")
                convertToAction.image = UIImage(systemName: "arrow.uturn.down")
            }
            
            return [convertToAction, convertFromAction]
            }
        
        return nil
    }
}
