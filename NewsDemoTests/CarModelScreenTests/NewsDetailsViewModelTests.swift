//
//  NewsDetailsViewModelTests.swift
//  NewsDemo
//
//  Created by Ali Adam on  6/17/19.
//  Copyright © 2019 Ali Adam. All rights reserved.
//


import XCTest

@testable import NewsDemo



class NewsDetailsViewModelTests: XCTestCase {
    
    var viewModel : NewsDetailsViewModel!
    
    // get a simple mockUp List
    let article :Article = MockupArticle.getArticle()
    

    
    override func setUp() {
        
        super.setUp()
        self.viewModel = NewsDetailsViewModel(article: article)
    }
    
 
    
    func testWithMockData() {
        XCTAssertEqual(viewModel.getArticleTitle(), article.title ?? "", "Expected to get title for the first item on list")
        XCTAssertEqual(viewModel.getArticleSource(), article.source?.name ?? "", "Expected to get source for the first item on list")
        XCTAssertEqual(viewModel.getArticleTime(), article.publishedAt?.dateFromTimestamp?.toDuration() ?? "", "Expected to get same duration for the first item on list")
        XCTAssertEqual(viewModel.getArticleimageURL(), article.urlToImage ?? "" , "Expected to get image for the first item on list")
        XCTAssertEqual(viewModel.getTitle(), article.title ?? "", "Expected to get  screen title")
    }

    
    
    
    override func tearDown() {
        self.viewModel = nil
        super.tearDown()
        
    }
    
}
