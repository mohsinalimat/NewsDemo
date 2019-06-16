//
//  UINavigationControllerExtension.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright © 2019 Ali Adam. All rights reserved.
//

import UIKit
extension UINavigationController {
    
    @IBInspectable var backgroundColor: UIColor {
        set {
            self.view.backgroundColor = newValue;
        }
        get {
            return self.view.backgroundColor ?? UIColor.black;
        }
    }
    
}
