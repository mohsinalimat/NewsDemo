//
//  NewsListViewModel.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright (c) 2019 Ali Adam. All rights reserved.
//

import RxSwift

class NewsListViewModel:ViewModel {

    // MARK: Variable
    var articleList: Variable<[Article]> =  Variable([])
    private let disposeBag = DisposeBag()
    let NewsListRepo: NewsListRepository!


     init(NewsListRepo:NewsListRepository) {
        self.NewsListRepo = NewsListRepo
        super.init()
        setupRx()
        getNewsList()
    }
    
    func getTitle() -> String {
        return LocalizableWords.newsList
    }
    
    func getArticleTitle(for row:Int) -> String {
        return self.articleList.value[row].title ?? ""
    }
    func getArticleTime(for row:Int) -> String {
        return self.articleList.value[row].publishedAt?.dateFromTimestamp?.convertTo() ?? ""
    }
    func getArticleSource(for row:Int) -> String {
        return self.articleList.value[row].source?.name ?? ""
    }
    func getArticleimageURL(for row:Int) -> String {
        return self.articleList.value[row].urlToImage ?? ""
    }
}

// MARK: Setup
private extension NewsListViewModel {

    func setupRx() {
        self.loadingDataSubject.subscribe({ [weak self] (event) in
            self?.getNewsList(type: event.element ?? .loadMore)
        }).disposed(by: disposeBag)
        
    }
    
    func getNewsList(type:LoadingType = .loadMore)  {
        self.activityIndicatorSubject.onNext(true)
        let parameters = JsonBodyHelper.formatBodyForGetNewsList(page: page, pageSize: pageSize, country: "us")
            self.NewsListRepo.getNewsList(with: parameters) {[weak self] (response) in
            self?.activityIndicatorSubject.onNext(false)
            switch response {
            case .success(let result):
                self?.parse(list: result ,type: type)
            case .error(let error):
                self?.handleError(error: error,type: type)

            }
        }
    }
    
    
    func parse(list: [Article],type:LoadingType = .loadMore) {
        if list.count < pageSize {
            self.canLoadMore.onNext(false)
        }
        switch type {
        case .refresh:
            self.articleList.value = list
        default:
            self.articleList.value.append(contentsOf: list)
        }
        
        
    }
  
}
