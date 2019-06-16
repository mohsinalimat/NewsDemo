//
//  ToastView.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright © 2019 Ali Adam. All rights reserved.
//

import UIKit

/// add toast view on top of currunt window
/// used when to show msg when there is no connection
class ToastView: UIView {
    
    private var label : UILabel!
    
    private var message: String = "" {
        didSet {
            label.text = message
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel(frame: CGRect(x: 0.0, y: 60.0, width: frame.width, height: 20.0))
        label.font = FontManager.APPSemiBold.fontWith(size: 20)
        label.textAlignment = .center
        label.text = message
        label.textColor =  Colors.brandwhite
        self.backgroundColor = Colors.brandOrange
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not used")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func show(with msg:String) {
        self.message = msg
        let window = UIApplication.shared.keyWindow!
        window.addSubview(self);
    }
    
    func dismiss() {
        self.removeFromSuperview()
    }
}
