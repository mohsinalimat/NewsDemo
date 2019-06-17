//
//  NewsListItemCell.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright © 2019 Ali Adam. All rights reserved.
//

import UIKit

class NewsListItemCell: UITableViewCell {
    
    
    //MARK: Outlets
    @IBOutlet weak var titLabel: UILabel!
    @IBOutlet weak var containerView: UIView!

    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var timelabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titLabel.textColor = Colors.brandBlack
        self.titLabel.font = FontManager.APPMedium.fontWith(size: 15)
        
        self.timelabel.textColor = Colors.brandGray
        self.timelabel.font = FontManager.APPLight.fontWith(size: 12)

        self.sourceLabel.textColor = Colors.brandMedGreen
        self.sourceLabel.font = FontManager.APPRegular.fontWith(size: 12)
        self.titLabel.text = ""
        self.timelabel.text = ""
        self.sourceLabel.text = ""
        containerView.layer.cornerRadius = 10.0
        
    }
    
    //MARK Methods
    func configure(with title: String,date: String,source: String,imageURL: String){
        self.titLabel.text = title
        self.timelabel.text = date
        self.sourceLabel.text = source
        CashImage.default.load(imageView: self.itemImageView, url: imageURL)
        
    }
        
    open class func identifier() -> String {
        return String(describing: NewsListItemCell.self)
    }
}
