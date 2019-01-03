//
//  NetworkHelper.swift
//  SunDay
//
//  Created by Genesis Mosquera on 12/28/18.
//  Copyright © 2018 Genesis Mosquera. All rights reserved.
//

import Foundation

final class NetworkHelper {
    static func performDataTask(urlString: String,
                                httpMethod: String,
                                completionHandler: @escaping (AppError?, Data?, HTTPURLResponse?) ->Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(AppError.badURL("\(urlString)"), nil, nil)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        
//        if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
//            completionHandler(nil, cachedResponse.data, cachedResponse.response as? HTTPURLResponse)
//        } else {
        
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let response = response as? HTTPURLResponse else {
                    completionHandler(AppError.noResponse, nil, nil)
                    return
                }
                print("response status code is \(response.statusCode)")
                if let error = error {
                    completionHandler(AppError.networkError(error), nil, response)
                } else if let data = data {
                    completionHandler(nil, data, response)
                }
                }.resume()
        }
    }

