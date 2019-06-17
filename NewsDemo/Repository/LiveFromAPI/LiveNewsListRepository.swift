//
//  Repository.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright © 2019 Ali Adam. All rights reserved.
//

import Foundation
import Alamofire

///get real liat from API inject it into viewmodel for unit testing
class LiveNewsListRepository: NewsListRepository {
    
    func getNewsList(with parameters:Parameters, completionHandler: @escaping (Response<[Article]>) -> ()) {
        NetworkProvider.shared.getNewsList(with: parameters) {(response) in
            switch response {
            case .success(let result):
                if result.status == "ok" {
                let list =  result.articles ?? []
                completionHandler(.success(list))
                }
                else {
                    let error = NSError(domain: result.message ?? "", code: -1, userInfo: nil)
                    completionHandler(.error(error))
                }
            case .error(let error):
                completionHandler(.error(error))
            }
        }
        
        
    }
    
    
    
}
