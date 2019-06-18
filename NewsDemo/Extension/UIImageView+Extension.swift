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
import SDWebImage

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
    // load image with  and add place holder during loading
    func loadImageFromUrl(_ url: String, andPlaceHolder placeHolder: UIImage) {
        self.showActivityIndicatorWith(style: .gray)
        self.image = placeHolder
        self.sd_setImage(with: URL(string: url),placeholderImage: placeHolder, completed: { [weak self]
            ( image, error, type, url) in
            self?.hideActivityIndicator()
        })
    }
    
    // load image with  and add activity indicator  during loading
    func loadImageFromUrl(_ url: String){
        let url2 = url.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed)
        
        self.showActivityIndicatorWith(style: .gray)
        self.sd_setImage(with: URL(string: url2 ?? "") , placeholderImage:#imageLiteral(resourceName: "placeholder") ,  completed: { [weak self]
            ( image, error, type, url) in
            self?.hideActivityIndicator()
        })
        
    }
    
    open func loadImage(_ url: String, completed completedBlock: SDExternalCompletionBlock? = nil){
        let url2 = url.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed)
        self.showActivityIndicatorWith(style: .gray)
        self.sd_setImage(with: URL(string: url2 ?? ""),  placeholderImage:#imageLiteral(resourceName: "placeholder") , completed: completedBlock)
        
        
        
    }
    
    
    
    /// add activityIndicator to the center of image view
    func showActivityIndicatorWith(style:UIActivityIndicatorView.Style) {
        
        if (self.activityIndicator == nil) {
            self.activityIndicator = UIActivityIndicatorView(style: style)
            self.activityIndicator.hidesWhenStopped = true
            self.activityIndicator.frame = CGRect(x:  0, y: 0, width: 30, height: 30);
            self.activityIndicator.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2);
            self.activityIndicator.autoresizingMask = [.flexibleLeftMargin , .flexibleRightMargin , .flexibleTopMargin , .flexibleBottomMargin]
            self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            self.activityIndicator.isUserInteractionEnabled = false
            OperationQueue.main.addOperation({ () -> Void in
                self.addSubview(self.activityIndicator)
                self.activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor)
                self.activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
                self.addConstraint(NSLayoutConstraint(item: self.activityIndicator!, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0))
                self.addConstraint(NSLayoutConstraint(item: self.activityIndicator!, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
                self.activityIndicator.startAnimating()
            })
        }
        else {
            self.activityIndicator.startAnimating()
        }
    }
    
    
    /// stop activityIndicator
    func hideActivityIndicator() {
        guard self.activityIndicator != nil else {
            return
        }
        OperationQueue.main.addOperation({ () -> Void in
            self.activityIndicator.stopAnimating()
        })
    }
    
    
}
