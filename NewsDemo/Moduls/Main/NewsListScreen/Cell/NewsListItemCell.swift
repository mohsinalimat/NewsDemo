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
        self.itemImageView?.image = #imageLiteral(resourceName: "placeholder")
        containerView.layer.cornerRadius = 10.0
        
    }
    
    
    func configure(with title: String,date: String,source: String,imageURL: String){
        setAlignment(title)
        self.titLabel.text = title
        self.timelabel.text = date
        self.sourceLabel.text = source
        self.itemImageView.loadImageFromUrl(imageURL, andPlaceHolder: #imageLiteral(resourceName: "placeholder"))
        
    }
    
    //MARK setAlignment
    // check if the cell is arabic  and make it right to left
    // else keep it left
    fileprivate func setAlignment(_ title: String) {
        if title.isArabic{
            self.containerView.semanticContentAttribute = .forceRightToLeft
            self.titLabel.textAlignment = .right
            self.timelabel.textAlignment = .right
            self.sourceLabel.textAlignment = .left
        }
        else {
            self.containerView.semanticContentAttribute = .forceLeftToRight
            self.titLabel.textAlignment = .left
            self.timelabel.textAlignment = .left
            self.sourceLabel.textAlignment = .right
        }
    }
    open class func identifier() -> String {
        return String(describing: NewsListItemCell.self)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titLabel.text = ""
        self.timelabel.text = ""
        self.sourceLabel.text = ""
        self.itemImageView?.image = #imageLiteral(resourceName: "placeholder")
    }
}
