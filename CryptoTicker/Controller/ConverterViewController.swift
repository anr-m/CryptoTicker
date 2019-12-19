//
//  ConverterViewController.swift
//  CryptoConverter
//
//  Created by Anuar on 11/11/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import UIKit
import SwiftySound

class ConverterViewController: UIViewController {

    var baseQuote: QuoteCached?
    var convertQuote: QuoteCached?
    var converter = Converter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBaseQuoteObserver()
        addConvertQuoteObserver()
        addTextFieldDidChangeTarget()
    }
    
    @IBOutlet weak var baseQuoteButton: UIButton!
    @IBOutlet weak var convertQuoteButton: UIButton!
    @IBOutlet weak var convertQuoteTextField: UITextField!
    @IBOutlet weak var baseQuoteLabel: UILabel!
    @IBOutlet weak var convertQuoteLabel: UILabel!
    @IBOutlet weak var baseQuoteTextField: UITextField!
    
    // MARK: - Button sound method
    
    @IBAction func buttonPressed(_ sender: Any) {
        Sound.play(file: Constants.click, fileExtension: "wav", numberOfLoops: 0)
    }
    
    // MARK: - Selector methods
    
    @objc func baseQuoteSelected(_ notification: Notification) {
        if let quote = notification.object as? QuoteCached {
            baseQuote = quote
            baseQuoteButton.setTitle("", for: .normal)
            baseQuoteButton.setImage(UIImage(named: quote.id) ?? UIImage(named: "bitcoin"), for: .normal)
            baseQuoteButton.backgroundColor = .none
            baseQuoteLabel.text = quote.name
            converter.baseQuote = quote
            baseQuoteTextField.text = ""
            convertQuoteTextField.text = ""
        }
    }
    
    @objc func convertQuoteSelected(_ notification: Notification) {
        
        if let quote = notification.object as? QuoteCached {
            convertQuote = quote
            convertQuoteButton.setTitle("", for: .normal)
            convertQuoteButton.setImage(UIImage(named: quote.id) ?? UIImage(named: "bitcoin"), for: .normal)
            convertQuoteButton.backgroundColor = .none
            convertQuoteLabel.text = quote.name
            baseQuoteTextField.text = ""
            convertQuoteTextField.text = ""
        }
    }
    
    // MARK: - Helper functions
    
    private func addBaseQuoteObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(baseQuoteSelected), name: Constants.sendBaseQuote, object: nil)
    }
    
    private func addConvertQuoteObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(convertQuoteSelected), name: Constants.sendConvertQuote, object: nil)
    }
    
    private func addTextFieldDidChangeTarget() {
        baseQuoteTextField.addTarget(self, action: #selector(self.textFieldDidChange), for: .editingChanged)
    }
    
    // MARK: - Navigation

      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
          if let destination = segue.destination as? QuoteTableViewController {
              if segue.identifier == Constants.baseQuoteSegue {
                  destination.isBaseQuoteSelectMode = true
              }
              destination.isSelectMode = true
          }
      }
}
