//
//  Constants.swift
//  CryptoConverter
//
//  Created by Anuar on 11/10/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import UIKit

enum Constants {
    
    static let quoteHeaderHeight = max(UIScreen.main.bounds.height, UIScreen.main.bounds.width)/20
    static let quoteRowHeight = max(UIScreen.main.bounds.height, UIScreen.main.bounds.width)/8
    static let detailFontSize = UIFont.systemFont(ofSize: max(UIScreen.main.bounds.height, UIScreen.main.bounds.width)/40)
    static let detailHeaderHeight = max(UIScreen.main.bounds.height, UIScreen.main.bounds.width)/30
    static let sendWebQuotes = Notification.Name("sendWebQuotes")
    static let sendCacheQuotes = Notification.Name("sendCacheQuotes")
    static let sendBaseQuote = Notification.Name("sendBaseQuote")
    static let sendConvertQuote = Notification.Name("sendConvertQuote")
    static let quoteCell = "quoteCellIdentifier"
    static let quoteHeader = "QuoteHeader"
    static let toQuoteDetailSegue = "toQuoteDetail"
    static let baseQuoteSegue = "baseQuoteSegue"
    static let convertQuoteSegue = "convertQuoteSegue"
    static let isSecondLaunch = "isSecondLaunch"
    static let onboardingVC = "Onboarding"
    static let cash = "cash"
    static let click = "click"
    
}
