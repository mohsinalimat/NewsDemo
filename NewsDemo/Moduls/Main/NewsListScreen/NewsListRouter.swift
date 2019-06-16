//
//  NewsListRouter.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright (c) 2019 Ali Adam. All rights reserved.
//

import Foundation

class NewsListRouter  : Router {

    func navigateToNewsDetailsScreen(article:Article) {
       let controller = NewsDetailsBuilder.viewController(article:article)
        viewController?.navigationController?.pushViewController(controller, animated: true)
    }
}
