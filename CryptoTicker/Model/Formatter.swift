//
//  Formatter.swift
//  CryptoConverter
//
//  Created by Anuar on 11/3/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import UIKit

class Formatter {
    
    private init() {
        
    }
    
    static func dateFormatter(_ dateString: String) -> String {
        
        guard let date = Int(dateString) else {
            return ""
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy, HH:mm:ss"
        
        let formattedDate = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(date)))
        
        return formattedDate
    }
    
    static func numberFormatter(_ numberString: String) -> String {
        
        guard let number = Double(numberString) else {
            return ""
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let formattedNumber = formatter.string(from: NSNumber(value: Int(number)))
        
        return formattedNumber ?? "error formatting"
    }
    
}
