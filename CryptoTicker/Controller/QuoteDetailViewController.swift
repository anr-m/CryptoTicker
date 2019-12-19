//
//  QuoteDetailViewController.swift
//  CryptoConverter
//
//  Created by Anuar on 11/2/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import UIKit

class QuoteDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var quoteLogoImage: UIImageView!
    @IBOutlet weak var quoteNameLabel: UILabel!
    @IBOutlet weak var quoteSymbolLabel: UILabel!
    @IBOutlet weak var quoteInfoTableView: UITableView!
    
    
    var quote: QuoteCached?
    var quoteDetail: [(String, [String])] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quoteInfoTableView.delegate = self
        quoteInfoTableView.dataSource = self
        
        if let quote = quote {
            quoteDetail = QuoteDetailDataSource.provideQuoteDetails(with: quote)
            quoteLogoImage.image = UIImage(named: quote.id) ?? UIImage(named: "bitcoin")
            quoteNameLabel.text = quote.name
            quoteSymbolLabel.text = quote.symbol
        }
        
    }
    
    // MARK: - UITableView datasource methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return quoteDetail.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quoteDetail[section].1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteDetailIdentifier", for: indexPath)
        
        cell.textLabel?.text = quoteDetail[indexPath.section].1[indexPath.row]
        cell.textLabel?.font = Constants.detailFontSize
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return quoteDetail[section].0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.detailHeaderHeight
    }
    
    // MARK: - UITableView delegate methods
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.font = Constants.detailFontSize
            header.tintColor = UIColor(named: "headerColor")
        }
    }
    
    // MARK: - Helper functions
    
    
}
