//
//  NewsListViewControllerTests.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/17/19.
//  Copyright © 2019 Ali Adam. All rights reserved.
//

import XCTest
@testable import NewsDemo

class NewsListViewControllerTests: XCTestCase {
    
    var NewsListVC: NewsListViewController!

    
  
    override func setUp() {
        super.setUp()
        NewsListVC = (NewsListBuilder.viewControllerWithMockupsList() as! NewsListViewController)
        let _ = self.NewsListVC?.view
    }
    
    func testViewData() {
        XCTAssertEqual(NewsListVC.title, NewsListVC.viewModel.screenTitle.value, "Expected title to be same as the title  from view model ")
        let rowsCount = NewsListVC.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(rowsCount,NewsListVC.viewModel.articleList.value.count , "Expected number Of Rows must equal the list count")

    }
    
    

    
    override func tearDown() {
        NewsListVC = nil
        super.tearDown()
    }
}
