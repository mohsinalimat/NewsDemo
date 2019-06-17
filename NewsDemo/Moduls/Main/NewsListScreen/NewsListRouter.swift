//
//  NewsListRouter.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright (c) 2019 Ali Adam. All rights reserved.
//

import Foundation
import RxRelay
class NewsListRouter  : Router {
    
    func navigateToNewsDetailsScreen(article:Article) {
        let controller = NewsDetailsBuilder.viewController(article:article)
        viewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func showFilter(selectedCountryCode:BehaviorRelay<String>,selectedCategoryCode:BehaviorRelay<String>) {
        let controller = FilterBuilder.viewController(selectedCountryCode:selectedCountryCode,selectedCategoryCode:selectedCategoryCode)
        controller.modalPresentationStyle = .overCurrentContext
        viewController?.present(controller, animated: true, completion: nil)
    }
}
