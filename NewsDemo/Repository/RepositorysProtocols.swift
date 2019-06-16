//
//  Repository.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright © 2019 Ali Adam. All rights reserved.
//

import Foundation
import Alamofire
protocol NewsListRepository {
    func getNewsList(with parameters:Parameters, completionHandler: @escaping (Response<[Article]>) -> ())
    
}


