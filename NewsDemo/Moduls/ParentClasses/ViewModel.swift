//
//  ParentViewModel.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright (c) 2019 Ali Adam. All rights reserved.
//

import RxSwift
import Reachability
/// base ViewModel have some common  that may be used in all ViewModel
class ViewModel {

    /// loading type enum
    enum LoadingType {
        case refresh
        case loadMore
    }

    private enum Constants {
        static let pageSize = 15
        static let page = 0
    }
    
    // MARK: Variable
    open var page = Constants.page
    open var pageSize = Constants.pageSize
    let activityIndicatorSubject = BehaviorSubject<Bool>(value: false)
    let networkStatusDidChangeSubject = PublishSubject<Bool>()
    let errorSubject = PublishSubject<String>()
    var canLoadMore = BehaviorSubject<Bool>(value: true)
    let loadingDataSubject = PublishSubject<LoadingType>()



    init() {
      /// Listen to netowrk status
      ReachabilityManager.shared.addListener(listener: self)
    }
    
    /// refresh data action
    func refresh() {
        page = Constants.page
        canLoadMore.onNext(true)
        loadingDataSubject.onNext(.refresh)
    }
    /// load more or load next page action
    func loadMore() {
        if (try! canLoadMore.value() ) {
            page = page + 1
            loadingDataSubject.onNext(.loadMore)
        }
    }
    
    /// get color for cell
  
    func handleError(error: Error,type:LoadingType = .loadMore)  {
        if type == .loadMore {
            self.page = self.page - 1
        }
        print(error.localizedDescription)
        self.errorSubject.onNext(LocalizableWords.loadingDataError)
    }
}

// MARK: - Network Status Listener handler
extension ViewModel: NetworkStatusListener {
    func networkStatusDidChange(status: Reachability.Connection) {
        switch status {
        case .none:
            networkStatusDidChangeSubject.onNext(false)
        case .wifi:
            networkStatusDidChangeSubject.onNext(true)
        case .cellular:
            networkStatusDidChangeSubject.onNext(true)

        }

    }
}





