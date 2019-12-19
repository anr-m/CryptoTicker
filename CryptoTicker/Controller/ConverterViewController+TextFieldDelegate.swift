//
//  ConverterViewController+TextFieldDelegate.swift
//  CryptoTicker
//
//  Created by Anuar on 11/26/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import UIKit

extension ConverterViewController: UITextFieldDelegate {
    
    // MARK: - Text field delegate methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        guard let baseQuote = baseQuote else {
            return
        }

        if let text = textField.text {
            if let amount = Double(text) {
                textField.text = "\(String(format: "%.2f", amount)) \(baseQuote.symbol)"
            }
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        guard let convertQuote = convertQuote else {
            convertQuoteTextField.text = "Select Convert Quote!"
            return
        }
        
        if let text = textField.text {
            if let amount = Double(text) {
                convertQuoteTextField.text = "\(String(format: "%.2f", converter.currencyConverter(convertQuote: convertQuote, amount: amount))) \(convertQuote.symbol)"
            } else {
                convertQuoteTextField.text = "Invalid amount"
            }
        }
    }
}
