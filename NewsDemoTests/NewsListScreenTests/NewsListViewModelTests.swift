//
//  NewsListViewModelTests.swift
//  NewsDemo
//
//  Created by Ali Adam on  6/17/19.
//  Copyright © 2019 Ali Adam. All rights reserved.
//


import XCTest

@testable import NewsDemo



class NewsListViewModelTests: XCTestCase {
    
    var viewModel : NewsListViewModel!
    
    var mockList : [Article] = []
    
    override func setUp() {
        super.setUp()
        let repo = MockupsNewsListRepository()
        self.viewModel = NewsListViewModel(NewsListRepo:repo)
        repo.getNewsList(with: [:]) { (response) in
            switch response {
            case .success(let list):
                self.mockList = list
            case .error(_):
                break
            }
        }
        
    }
    
    
    
    override func tearDown() {
        self.viewModel = nil
        super.tearDown()
        
    }
    
    
    
    func testWithMockData() {
        for index in 0..<mockList.count {
        XCTAssertEqual(viewModel.getArticleTitle(for: index), mockList[index].title, "Expected to get title for the first item on list")
        XCTAssertEqual(viewModel.getArticleSource(for: index), mockList[index].source?.name ?? "", "Expected to get source for the first item on list")
        XCTAssertEqual(viewModel.getArticleTime(for: index), mockList[index].publishedAt?.dateFromTimestamp?.toDuration() ?? "", "Expected to get same duration for the first item on list")
        XCTAssertEqual(viewModel.getArticleimageURL(for: index), mockList[index].urlToImage, "Expected to get image for the first item on list")
        XCTAssertEqual(viewModel.articleList.value.count, mockList.count, "Expected to get same count as the provided list")
        XCTAssertEqual(viewModel.getTitle(), LocalizableWords.newsList, "Expected to get  screen title")
        }
    }
    
    func testFetchAndRefreshData() {
        
        viewModel.articleList.asObservable().subscribe({ event in
            let count = event.element!.count
            XCTAssertLessThanOrEqual(count, self.viewModel.pageSize, "Expected list count  less or equal to the viewmodel page size")
        }).dispose()

        viewModel.refresh()
    }
    
}
