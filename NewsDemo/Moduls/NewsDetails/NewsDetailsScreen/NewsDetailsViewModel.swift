//
//  NewsDetailsViewModel.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright (c) 2019 Ali Adam. All rights reserved.
//

import RxSwift

class NewsDetailsViewModel :ViewModel{
    
    // MARK: Variable
    private let  article:Article!
    private let disposeBag = DisposeBag()

    
    init(article:Article) {
        self.article = article
        super.init()
    }
    
    func getTitle() -> String {
        return self.article.title ?? ""
    }
    func getArticleTitle() -> String {
        return self.article.title ?? ""
    }
    func getArticleTime() -> String {
        return self.article.publishedAt?.dateFromTimestamp?.convertTo() ?? ""
    }
    func getArticleSource() -> String {
        return self.article.source?.name ?? ""
    }
    func getArticleimageURL() -> String {
        return self.article.urlToImage ?? ""
    }

    
    func getArticleDetails() -> NSAttributedString {
        let headerAttributes = [NSAttributedString.Key.foregroundColor: Colors.brandBlack,
                                NSAttributedString.Key.font: FontManager.APPSemiBold.fontWith(size: 20)]
        let titleAttributes = [NSAttributedString.Key.foregroundColor: Colors.brandGray,
                               NSAttributedString.Key.font: FontManager.APPMedium.fontWith(size: 20)]
        
        
        let attriString = NSAttributedString(string:"", attributes:headerAttributes)
        let mutableAttrString = NSMutableAttributedString(attributedString: attriString)
        mutableAttrString.append(NSAttributedString(string:"\(article.description ?? "")\n", attributes:titleAttributes))
        mutableAttrString.append(NSAttributedString(string:"\(article.content ?? "")\n", attributes:titleAttributes))
        
        return mutableAttrString
    }
    
   
    
   
}

