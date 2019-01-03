//
//  Quotes.swift
//  SunDay
//
//  Created by Genesis Mosquera on 12/28/18.
//  Copyright © 2018 Genesis Mosquera. All rights reserved.
//

import Foundation

struct  QuoteData: Codable {
    let qotd_date: String
    let quote: Quote
}
struct Quote: Codable {
    let id: Int
    let url: String
    let author: String
    let body: String
}
