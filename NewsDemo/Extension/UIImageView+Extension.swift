//
//  UIImageView+Extension.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright © 2017 Ali Adam. All rights reserved.
//

import Foundation
import UIKit
import ObjectiveC

///

private var activityIndicatorAssociationKey: UInt8 = 0

// MARK: - Add UIActivityIndicatorView to UIImageView
/// i add this method  to  UIImageView class you can show and hide
/// ActivityIndicator on any imageview  with easy way

extension UIImageView {
    var activityIndicator: UIActivityIndicatorView! {
        get {
            return objc_getAssociatedObject(self, &activityIndicatorAssociationKey) as? UIActivityIndicatorView
        }
        set(newValue) {
            objc_setAssociatedObject(self, &activityIndicatorAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// add activityIndicator to the center of image view
    func showActivityIndicator() {
        if (self.activityIndicator == nil) {
            self.activityIndicator = UIActivityIndicatorView(style: .gray)
            self.activityIndicator.hidesWhenStopped = true
            self.activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 60.0, height: 60.0);
            self.activityIndicator.style = .gray
            self.activityIndicator.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2);
            self.activityIndicator.autoresizingMask = [.flexibleLeftMargin , .flexibleRightMargin , .flexibleTopMargin , .flexibleBottomMargin]
            self.activityIndicator.isUserInteractionEnabled = false
            OperationQueue.main.addOperation({ () -> Void in
                self.addSubview(self.activityIndicator)
                self.activityIndicator.startAnimating()
            })
        }
        else{
            OperationQueue.main.addOperation({ () -> Void in
                self.activityIndicator.startAnimating()
            })
        }
    }
    
    
    /// stop activityIndicator 
    func hideActivityIndicator() {
        OperationQueue.main.addOperation({ () -> Void in
            self.activityIndicator.stopAnimating()
        })
    }
}
