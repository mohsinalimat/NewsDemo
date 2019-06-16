//
//  NetworkRouter.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright © 2019 Ali Adam. All rights reserved.
//

import Alamofire

enum NetworkRouter: URLRequestConvertible {
    
    private enum Constants {
        static let version = "v2"
        static let basePath = ""
    }
    
    case getNewsList(Parameters)
    
    
    var method: HTTPMethod {
        switch self {
        case .getNewsList:
            return .get
        }
    }
    var path: String {
        switch self {
       
        case .getNewsList:
            return "/top-headlines"

        }
    }
    func getHTTPHeaders() -> HTTPHeaders? {
            return ["Content-Type" : "application/json"]
    }
    
    
    func asURLRequest() throws -> URLRequest {
        let url:URL = URL.baseServerURL!.appendingPathComponent(Constants.version).appendingPathComponent(Constants.basePath).appendingPathComponent(path)
        var urlRequest: URLRequest = URLRequest(url: url)
            urlRequest.httpMethod = method.rawValue
            urlRequest.allHTTPHeaderFields = getHTTPHeaders()
        
        
        switch self {
            case .getNewsList(let params):
                return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        }
    }
}
