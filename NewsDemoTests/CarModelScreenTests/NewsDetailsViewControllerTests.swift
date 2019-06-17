//
//  NewsDetailsViewControllerTests.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/17/19.
//  Copyright © 2019 Ali Adam. All rights reserved.
//

import XCTest
@testable import NewsDemo

class NewsDetailsViewControllerTests: XCTestCase {
    
    var NewsDetailsVC: NewsDetailsViewController!
    let article :Article = MockupArticle.getArticle()

   
    override func setUp() {
        super.setUp()
        NewsDetailsVC = (NewsDetailsBuilder.viewController(article: article) as! NewsDetailsViewController)
        let _ = self.NewsDetailsVC?.view
        
    }
    
    func testViewData() {
        XCTAssertEqual(NewsDetailsVC.title, article.title ?? "" , "Expected title to be same as the title  provided to the viewModel ")
        let rowsCount = NewsDetailsVC.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(rowsCount, NewsDetailsVC.viewModel.getNumberOfRows(), "Expected number Of Rows must equal the list coun")

    }
    
    

    
    override func tearDown() {
        NewsDetailsVC = nil
        super.tearDown()
    }
}
