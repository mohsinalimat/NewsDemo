//
//  NewsListViewController.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright (c) 2019 Ali Adam. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NewsListViewController: ViewController {
    
    // MARK: Variable
    private var router: NewsListRouter!
    private let disposeBag = DisposeBag()
    var viewModel: NewsListViewModel!

    // MARK: IBOutlet
    @IBOutlet var tableView : UITableView!
    
    
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupRx()
    }
    // MARK: Methods
    /// inject viewModel and router into controller
    func set(withViewModel viewModel: NewsListViewModel, router: NewsListRouter) {
        self.viewModel = viewModel
        self.router = router
    }
}

// MARK: Setup
private extension NewsListViewController {
    

    
    /// setup things related to views set title and add pull to refrsh to table
    func setupViews() {
        showNavBar()
        setTitle()
        registerCellNib()
        addPullToRefresh()
    }
    
    /// Data binding
    func setupRx() {
        handleViewModelActivityIndicatorStatus()
        handleCanLoadMoreEvents()
        bindViewModelData()
        handleCellTap()
        handleViewModelErrors()
        //let items = ["1","2","3"]
//        self.presentAlertPickerTitle(title: LocalizableWords.error, message: "msg", options:items) { (option) in
//            print("option: \(option)")
//        }
    }
}



// MARK: Setup Methods
private extension NewsListViewController {
    
    /// bind ViewModel list to tableview to show it
    func bindViewModelData()  {
        viewModel.articleList.asObservable().bind(to: tableView.rx.items(cellIdentifier:  NewsListItemCell.identifier(), cellType: NewsListItemCell.self)) {[weak self] (row, element, cell) in
            if let title = self?.viewModel.getArticleTitle(for: row),
            let date = self?.viewModel.getArticleTime(for: row),
            let source = self?.viewModel.getArticleSource(for: row),
            let imageURL = self?.viewModel.getArticleimageURL(for: row){
                cell.configure(with: title, date: date, source: source, imageURL: imageURL)
            }
            }
            .disposed(by: disposeBag)
    }
    
    /// handel  cell taped
    func handleCellTap() {
        
        tableView.rx.modelSelected(Article.self).subscribe(onNext: { [weak self] article in
            self?.router.navigateToNewsDetailsScreen(article: article)
        }).disposed(by:disposeBag)
    }
    
    /// handel error msg from viewModel
    func handleViewModelErrors() {
        viewModel.errorSubject.subscribe({ [weak self] (event) in
            if let msg =  event.element {
                self?.router.showErrorAlert(msg: msg)
            }
        }).disposed(by: disposeBag)
    }
    
    
    
    /// handle sActivaty Indicator Visabilty
    func handleViewModelActivityIndicatorStatus() {
        viewModel.activityIndicatorSubject.subscribe({ [weak self] (event) in
            self?.setActivatyIndicatorVisabilty(visable: event.element ?? false)
            self?.stopTableViewLoadingIndicators()
        }).disposed(by: disposeBag)
    }
    
    
    /// handle changes on canloadMore variable to stop loading more when data finished
    func handleCanLoadMoreEvents() {
        viewModel.canLoadMore.subscribe({ [weak self] (event) in
            if !event.element!{
                self?.removeLoadingMoreFromTable()
                
            }
        }).disposed(by: disposeBag)
    }
    
    
    
    /// add load more Indicator to table
    func addLoadMoreIndicator()  {
        self.tableView.es.addInfiniteScrolling { [weak self] in
            self?.viewModel.loadMore()
        }
    }
    
    /// add pull to refresh to table
    func addPullToRefresh()  {
        self.tableView.es.addPullToRefresh { [weak self] in
            self?.viewModel.refresh()
            self?.tableView.es.resetNoMoreData()
            self?.addLoadMoreIndicator()
        }
        
        self.addLoadMoreIndicator()
    }
    
    /// register Cell on table view
    func registerCellNib() {
        tableView.register(UINib(nibName: NewsListItemCell.identifier(), bundle: nil), forCellReuseIdentifier: NewsListItemCell.identifier())
    }
    
    /// stop loading more and pull to refresh Indicators
    func stopTableViewLoadingIndicators() {
        DispatchQueue.main.async{
            self.tableView.es.stopLoadingMore()
            self.tableView.es.stopPullToRefresh()
        }
    }
    
    /// remove loading more from table
    func removeLoadingMoreFromTable() {
        DispatchQueue.main.async{
            self.tableView.es.removeRefreshFooter()
            self.tableView.es.noticeNoMoreData()
            self.tableView.es.stopLoadingMore()
            self.tableView.es.stopPullToRefresh()
        }
    }
    
    func setTitle() {
        self.title = viewModel.getTitle()
    }
}
