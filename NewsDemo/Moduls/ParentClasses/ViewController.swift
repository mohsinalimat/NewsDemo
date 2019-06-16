//
//  ParentViewController.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright (c) 2019 Ali Adam. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ESPullToRefresh

/// Base contrroler   have some common methods that may be used in all screen
class ViewController: UIViewController {


    ///  hide NavigationBarHidden
    func hideNavBar(){
        navigationController?.isNavigationBarHidden = true
    }
    /// show NavigationBarHidden
    func showNavBar(){
        navigationController?.isNavigationBarHidden = false

    }

    /// show or hide Activaty Indicator
    func setActivatyIndicatorVisabilty(visable:Bool)  {
        if visable {
            self.showActivaty()
        }
        else {
            self.hideActivity()
        }
    }
    
    /// show Activaty Indicator
    private func showActivaty(){
        ActivityIndicator.shared.animateActivity(title: LocalizableWords.loading, navigationItem: self.navigationItem)
        
    }
    
    /// hide Activaty Indicator
    private func hideActivity(){
        ActivityIndicator.shared.stopAnimating(navigationItem: self.navigationItem)
        
    }
}


extension ViewController {
    /// show alert on controller
    func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
}


extension ViewController {
    /// show alert on controller
    func presentAlertPickerTitle(title: String, message: String, options: [String], completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.actionSheet)
        
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        present(alertController, animated: true, completion: nil)
//        let vc = UIViewController()
//        vc.preferredContentSize = CGSize(width: 250,height: 300)
//        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
//        pickerView.delegate = self
//        pickerView.dataSource = self
//        vc.view.addSubview(pickerView)
//        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//
//        alertController.setValue(vc, forKey: "contentViewController")
//        for (index, option) in options.enumerated() {
//            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
//                completion(index)
//            }))
//        }
//        self.present(alertController, animated: true, completion: nil)
    }
}


