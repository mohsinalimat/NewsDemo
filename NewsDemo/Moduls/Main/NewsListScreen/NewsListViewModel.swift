//
//  NewsListViewModel.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright (c) 2019 Ali Adam. All rights reserved.
//

import RxSwift
import RxRelay
class NewsListViewModel:ViewModel {
    
    // MARK: Variable
    var articleList =  BehaviorRelay<[Article]>(value:[])
    private let disposeBag = DisposeBag()
    let NewsListRepo: NewsListRepository!
    var selectedCountryCode = BehaviorRelay<String>(value:FilterList.getDefaultCountry())
    var selectedCategoryCode = BehaviorRelay<String>(value:FilterList.getDefaultCategory())
    var screenTitle = BehaviorRelay<String>(value:LocalizableWords.newsList)
    
    
    init(NewsListRepo:NewsListRepository) {
        self.NewsListRepo = NewsListRepo
        super.init()
        setupRx()
        getNewsList()
    }
    
    //    func getTitle() -> String {
    //        screenTitle.accept(selectedCategoryCode.value == "" ? LocalizableWords.newsList : selectedCategoryCode.value)
    //    }
    
    func getArticleTitle(for row:Int) -> String {
        return self.articleList.value[row].title ?? ""
    }
    func getArticleTime(for row:Int) -> String {
        return self.articleList.value[row].publishedAt?.dateFromTimestamp?.toDuration() ?? ""
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
        
        self.selectedCategoryCode.asObservable().subscribe(onNext: { [weak self] country in
            self?.screenTitle.accept(self?.selectedCategoryCode.value == "" ? LocalizableWords.newsList : self?.selectedCategoryCode.value ?? LocalizableWords.newsList)
            self?.getNewsList(type:.refresh)
        }).disposed(by: disposeBag)
        
        self.selectedCountryCode.asObservable().subscribe(onNext: { [weak self] cat in
            self?.getNewsList(type:.refresh)
        }).disposed(by: disposeBag)
    }
    
    func getNewsList(type:LoadingType = .loadMore)  {
        self.activityIndicatorSubject.onNext(true)
        let parameters = JsonBodyHelper.formatBodyForGetNewsList(page: page, pageSize: pageSize, country: selectedCountryCode.value, category:selectedCategoryCode.value)
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
            self.articleList.accept(list)
        default:
            self.articleList.accept( self.articleList.value + list)
        }
        
        
    }
    
}
