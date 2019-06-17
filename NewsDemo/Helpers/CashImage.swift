//
//  CashImage.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright © 2017 Ali Adam. All rights reserved.
//

import Foundation
import UIKit

/// this class to load and cash images
class CashImage: NSObject {
    static let `default` = CashImage()

     let cache = NSCache<AnyObject,AnyObject>()
    
    /// CashImage init method
    ///
    override init() {
        cache.name = "NewsDemoCashImage"
        cache.countLimit = 20
        cache.totalCostLimit = 15
}
    /// load image from cach
    ///
    /// - Parameter key: key
    /// - Returns: image
    func getImageFor(key :String) -> UIImage? {
        let image =  cache.object(forKey:key as AnyObject) as? UIImage
        return image
    }
    
    /// save image to cach
    ///
    /// - Parameters:
    ///   - image: image to be save
    ///   - key: key
    func saveImage(image : UIImage ,key :String) {
        cache.setObject(image, forKey:key as AnyObject)
    }
    
    /// load the image and save it to the cash or load it from the cash
    ///
    /// - Parameters:
    ///   - imageView: imageView to add the image on it
    ///   - url: image url
    func load(imageView : UIImageView ,url :String) {
        
        /// showActivityIndicator method you can find it on UIImageView+Extension.swift
        /// i add this method  to  UIImageView class you can show and hide
        /// ActivityIndicator on any imageview  with easy way
        imageView.image = nil

        /// check if image cached or not if exist load it from the cach if not load it
        if  CashImage.default.getImageFor(key: url) != nil{
            DispatchQueue.main.async {
            imageView.showActivityIndicator()
            let image =  CashImage.default.getImageFor(key: url)!
            imageView.image = image
            imageView.hideActivityIndicator()
            }
        }
        else{
            CashImage.default.loadImageFor(imageView:imageView,url: url)
        }
  }
    
    
    /// load image from server
    ///
    /// - Parameters:
    ///   - imageView: imageView to add the image on it
    ///   - url: image url
    func loadImageFor(imageView : UIImageView ,url :String){
        imageView.showActivityIndicator()

        let imageURL = URL(string: url)
        var image: UIImage?
        if let imgurl = imageURL {
            DispatchQueue.global(qos: .userInitiated).async {
                let imageData = NSData(contentsOf: imgurl)
                DispatchQueue.main.async {
                    if imageData != nil {
                        image = UIImage(data: imageData! as Data)
                        imageView.image = image
                        CashImage.default.saveImage(image: image! ,key: url)
                        imageView.hideActivityIndicator()
                        
                    } else {
                        image = nil
                    }
                }
            }
        }
    }
}
