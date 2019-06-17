//
//  NewsDetailsBuilder.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright (c) 2019 Ali Adam. All rights reserved.
//

import UIKit
//Builder: initialize ViewController, ViewModel and Router
struct NewsDetailsBuilder {
    
    /// get ViewController instanse 
    static func viewController(article:Article) -> ViewController {
        let viewModel = NewsDetailsViewModel(article:article)
        let viewController : NewsDetailsViewController = UIStoryboard.storyboard(.newsdetails).instantiateViewController()
        viewController.set(withViewModel: viewModel)
        
        return viewController
    }
    
}
