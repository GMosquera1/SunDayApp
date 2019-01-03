//
//  RandomAPIClient.swift
//  SunDay
//
//  Created by Genesis Mosquera on 12/28/18.
//  Copyright © 2018 Genesis Mosquera. All rights reserved.
//

import Foundation
// random will be QOTD
final class RandomAPIClient {
    
    static func getRandomQuote(completionHandler: @escaping ((QuoteData?, AppError?) -> Void)) {
        let urlString = "https://favqs.com/api/qotd"
        NetworkHelper.performDataTask(urlString: urlString, httpMethod: "GET") { (error, data, response) in
            if let error = error {
                completionHandler(nil, error)
            } else if let data = data {
                do {
                    let quoteOfDay = try JSONDecoder().decode(QuoteData.self, from: data)
                    completionHandler(quoteOfDay, nil)
                } catch {
                    completionHandler(nil, AppError.decodingError(error))
                }
            }
        }
    }
}
