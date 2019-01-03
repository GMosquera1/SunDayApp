//
//  InitialViewController.swift
//  SunDay
//
//  Created by Genesis Mosquera on 12/28/18.
//  Copyright © 2018 Genesis Mosquera. All rights reserved.
//

import UIKit

class SearchDetailViewController: UIViewController {
    
    @IBOutlet weak var todaysDate: UILabel!
    @IBOutlet weak var quoteBody: UITextView!
    @IBOutlet weak var quoteAuthor: UILabel!
    
    public var quotes: MultipleQuotes!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {

        if let quoteTextView = quotes?.quoteText {
            quoteBody.text = quoteTextView
        } else {
            quoteBody.text = "No Quote Could Suffice"
        }
        
        if let quotesLabel = quotes?.quoteAuthor {
            quoteAuthor.text = quotesLabel
        } else {
            quoteAuthor.text = "You Be The Writer"
        }
    }
    
}
