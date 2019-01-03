//
//  RandomViewController.swift
//  SunDay
//
//  Created by Genesis Mosquera on 12/28/18.
//  Copyright © 2018 Genesis Mosquera. All rights reserved.
//

import UIKit

class qotdController: UIViewController {
    
    @IBOutlet weak var todaysDate: UILabel!
    
    @IBOutlet weak var quoteOfTheDay: UITextView!
    
    @IBOutlet weak var authorOfQuote: UILabel!
    
    public var quotes: Quote!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        
    }
    private func updateUI() {
        title = quotes.author
//        if let description  = event.description {
//            eventDescription.text = description.stripHTML()
//        }
//
        if let dateString = quotes?.author {
            todaysDate.text = dateString
        } else {
            todaysDate.text = "no date available"
        }
        
        if let quoteField = quotes?.body {
            quoteOfTheDay.text = quoteField
        } else {
            quoteOfTheDay.text = "No Quote Available"
        }
        if let authorLabel = quotes?.author {
            authorOfQuote.text = authorLabel
        } else {
            authorOfQuote.text = "No Author Available"
        }
    }
    
}
