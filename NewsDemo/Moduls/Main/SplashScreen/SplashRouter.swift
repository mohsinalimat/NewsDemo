//
//  SplashRouter.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright (c) 2019 Ali Adam. All rights reserved.
//

import Foundation

class SplashRouter : Router {

    func navigateToNewsList() {
        let controller = NewsListBuilder.viewController()
        viewController?.navigationController?.setViewControllers([controller], animated: true)
    }
}
