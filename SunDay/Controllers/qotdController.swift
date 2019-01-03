//
//  qotdController.swift
//  SunDay
//
//  Created by Genesis Mosquera on 12/29/18.
//  Copyright © 2018 Genesis Mosquera. All rights reserved.
//

import UIKit

class qotdController: UIViewController {
    @IBOutlet weak var todaysDate: UILabel!
    @IBOutlet weak var quoteBody: UITextView!
    @IBOutlet weak var quoteAuthor: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
//        let date = Date()
//        let isoDateFormatter = ISO8601DateFormatter()
//        isoDateFormatter.formatOptions = [.withFullDate,.withDashSeparatorInDate]
//        let timeStamp = isoDateFormatter.string(from: date)
        RandomAPIClient.getRandomQuote { (quote, error) in
            if let quote = quote {
                let isoDateFormatter = ISO8601DateFormatter()
                isoDateFormatter.formatOptions = [.withFullDate,.withDashSeparatorInDate]
                let myDate = isoDateFormatter.date(from: quote.qotd_date)
                DispatchQueue.main.async {
                self.quoteBody.text = quote.quote.body
                self.todaysDate.text = isoDateFormatter.string(from: myDate!)
                self.quoteAuthor.text = quote.quote.author
            }
            }
            
            if let error = error {
                self.quoteBody.text = "No Quote Could Suffice"
                self.todaysDate.text = "No Date Available"
                self.quoteAuthor.text = "You Be The Writer"
                print(error)
                
            }
        }

    }
    
}
