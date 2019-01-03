//
//  QuotesAPIClient.swift
//  SunDay
//
//  Created by Genesis Mosquera on 12/28/18.
//  Copyright © 2018 Genesis Mosquera. All rights reserved.
//

import Foundation
final class QuotesAPIClient {
    
    static func getQuote(completionHandler: @escaping ((MultipleQuotes?, AppError?) -> Void)) {
        let urlString = "http://api.forismatic.com/api/1.0/?format=json&method=getQuote&lang=en"
        
        NetworkHelper.performDataTask(urlString: urlString, httpMethod: "GET") { (error, data, response) in
            if let error = error {
                completionHandler(nil, error)
            } else if let data = data {
                do {
                    
                    let quoteOfDay = try JSONDecoder().decode(MultipleQuotes.self, from: data)
                    completionHandler(quoteOfDay, nil)
                    
                } catch {
                    completionHandler(nil, AppError.decodingError(error))
                }
            }
            }
            
        
    }
}
