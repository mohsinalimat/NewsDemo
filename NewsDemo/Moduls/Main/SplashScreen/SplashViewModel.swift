//
//  SplashViewModel.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright (c) 2019 Ali Adam. All rights reserved.
//

import RxSwift

class SplashViewModel:ViewModel {

    // MARK: Variable
    let networkSubject = BehaviorSubject<Bool>(value: false)

    override init() {
       super.init()
    }
}

