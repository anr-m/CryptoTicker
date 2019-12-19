//
//  QuoteTableTableViewController.swift
//  CryptoConverter
//
//  Created by Anuar on 11/2/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import UIKit
import PullToRefresh
import AnimatableReload
import RealmSwift
import SwiftySound

class QuoteTableViewController: UITableViewController {
    
    let refresher = PullToRefresh()
    var isSelectMode = false
    var isBaseQuoteSelectMode = false
    var quoteCacheProvider: QuoteCacheProvider?
    var quoteWebProvider: QuoteWebProvider?
    var updatedQuoteArray: [QuoteCached] = []
    @IBOutlet weak var timerLabel: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showOnboarding()
        addObserver()
        updatedQuoteArray = RealmMethods.readData()
        addPullToRefresh()
        
        // Initialize quoteProvider
        if !isSelectMode {
            quoteCacheProvider = QuoteCacheProvider()
            quoteWebProvider = QuoteWebProvider()
        }
    }
    
    // Deinitializer to remove PullToRefresh when view controller is releasing
    deinit {
        tableView.removeAllPullToRefresh()
    }

    // MARK: - Helper functions
    
    private func showOnboarding() {
        
        // Check if this is the first launch of the app and display onboardingViewController
        if UserDefaults.standard.bool(forKey: Constants.isSecondLaunch) == false {
            UserDefaults.standard.set(true, forKey: Constants.isSecondLaunch)
            
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: Constants.onboardingVC) as? OnboardingViewController {
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    private func addObserver() {
        
        // Add observer for updated quotes
        NotificationCenter.default.addObserver(self, selector: #selector(refreshTableData), name: Constants.sendCacheQuotes, object: nil)
    }
    
    private func addPullToRefresh() {
        
        // Add PullToRefresh to tableView
        if !isSelectMode {
            tableView.addPullToRefresh(refresher) {
                self.quoteWebProvider?.restartTimer()
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == Constants.toQuoteDetailSegue, isSelectMode == false else {
            return
        }
        
        if let quoteDetailView = segue.destination as? QuoteDetailViewController {
            if let quote = sender as? QuoteCached {
                quoteDetailView.quote = quote
            }
        }
    }
}
