//
//  JsonBodyHelper.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright © 2019 Ali Adam. All rights reserved.
//



import  Alamofire


class JsonBodyHelper {
   
    private enum Keys {
        static let apiKey = "apiKey"
        static let page = "page"
        static let pageSize = "pageSize"
        static let country = "country"
        static let category = "category"

    }
    
    private class  func getDefaultParameters() -> Parameters  {
        
        if let apiKey = URL.apiKey {
        let parameters :Parameters = [Keys.apiKey:apiKey]
        return parameters
        }
        
        return [:]
    }
    
   
    class func formatBodyForGetNewsList(page: Int, pageSize: Int,country:String, category:String) -> Parameters  {
        var parameters :Parameters = getDefaultParameters()
         parameters[Keys.page] = page
        parameters[Keys.pageSize] = pageSize
        parameters[Keys.country] = country
        if category != "" {
            parameters[Keys.category] = category

        }
        return parameters
    }

    
  
    
}



