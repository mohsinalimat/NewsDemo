//
//  URLExtension.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright © 2019 Ali Adam. All rights reserved.
//


import Foundation

extension URL {
    
    static var baseServerURL: URL? {
        guard let baseURL = (Bundle.main.infoDictionary?["BaseServerURL"] as? String)?.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else { return nil }
        return try? baseURL.asURL()
    }
    
    static var apiKey: String? {
        guard let apiKey = Bundle.main.infoDictionary?["apiKey"] as? String else { return nil }
        return apiKey
    }
}

