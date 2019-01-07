//
//  RandomizedViewController.swift
//  SunDay
//
//  Created by Genesis Mosquera on 1/7/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class RandomizedViewController: UIViewController {
    
    @IBOutlet weak var quoteBody: UITextView!
    @IBOutlet weak var quoteAuthor: UILabel!
    
    private var randomized: MultipleQuotes!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    private func updateUI() {
        QuotesAPIClient.getQuote { (quote, error) in
            if let error = error{
                
            }
             if let data = quote {
                self.randomized = data
               print(self.randomized)
                DispatchQueue.main.async {
                self.quoteBody.text = self.randomized.quoteText
                self.quoteAuthor.text = self.randomized.quoteAuthor
                }
            }
        }
    }
}
