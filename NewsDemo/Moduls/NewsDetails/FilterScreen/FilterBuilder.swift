//
//  AlertBuilder.swift
//  "NewsDemo
//
//  Created by Ali Adam on 6/17/19.
//  Copyright (c) 2019 Ali Adam. All rights reserved.
//

import UIKit
import RxRelay
//Builder: initialize ViewController, ViewModel and Router
struct FilterBuilder {
    
    /// get ViewController instanse
    static func viewController(selectedCountryCode:BehaviorRelay<String>,selectedCategoryCode:BehaviorRelay<String>) -> ViewController {
        let viewModel = FilterViewModel(selectedCountryCode:selectedCountryCode,selectedCategoryCode:selectedCategoryCode)
        let viewController : FilterViewController =  UIStoryboard.storyboard(.newsdetails).instantiateViewController()
        viewController.set(withViewModel: viewModel)
        return viewController
    }
    
    
    
}
