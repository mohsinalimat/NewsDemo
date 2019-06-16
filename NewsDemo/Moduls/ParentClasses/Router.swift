//
//  ParentRouter.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright (c) 2019 Ali Adam. All rights reserved.
//

import Foundation


/// base router have some common methods that may be used in all screen like alert
class Router {
    weak var viewController: ViewController?
    
 
    /// show error alert
    ///
    /// - Parameter msg: msg to show
    func showErrorAlert(msg:String) {
        viewController?.presentAlertWithTitle(title: LocalizableWords.error, message: msg, options: LocalizableWords.okay) { (option) in
            print("option: \(option)")
        }
    }
}
