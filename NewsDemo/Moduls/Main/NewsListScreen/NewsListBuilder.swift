//
//  NewsListBuilder.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright (c) 2019 Ali Adam. All rights reserved.
//

import UIKit

//Builder: initialize ViewController, ViewModel and Router
struct NewsListBuilder {

    /// get ViewController instanse
    static func viewController() -> ViewController {
        let rep = LiveNewsListRepository()
        let viewModel = NewsListViewModel(NewsListRepo:rep)
        let router = NewsListRouter()
        let viewController : NewsListViewController = UIStoryboard.storyboard(.main).instantiateViewController()
        viewController.set(withViewModel: viewModel, router: router)
        router.viewController = viewController

        return viewController
    }
    
    // get ViewController instanse for unittesting to test it with mock data
    static func viewControllerWithMockupsList() -> ViewController {
        let rep = MockupsNewsListRepository()
        let viewModel = NewsListViewModel(NewsListRepo:rep)
        let router = NewsListRouter()
        let viewController : NewsListViewController = UIStoryboard.storyboard(.main).instantiateViewController()
        viewController.set(withViewModel: viewModel, router: router)
        router.viewController = viewController
        
        return viewController
    }
}
