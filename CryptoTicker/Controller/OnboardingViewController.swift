//
//  OnboardingViewController.swift
//  CryptoConverter
//
//  Created by Anuar on 11/23/19.
//  Copyright © 2019 Anuarbek Mukhanov. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    var counter = 0
    let images = ["onboarding-2", "onboarding-3", "onboarding-4", "onboarding-5"]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        if counter == 4 {
            self.dismiss(animated: true, completion: nil)
            return
        } else if counter == 3 {
            nextButton.setTitle("Done", for: .normal)
        }
        
        UIView.transition(with: imageView,
        duration: 0.75,
        options: .transitionCrossDissolve,
        animations: { self.imageView.image = UIImage(named: self.images[self.counter])},
        completion: nil)
        
        counter += 1
    }
}
