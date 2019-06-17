//
//  NewsDetailsViewController.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright (c) 2019 Ali Adam. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NewsDetailsViewController: ViewController {
    
    // MARK: Variable
    var viewModel: NewsDetailsViewModel!
    private var router: Router!
    private let disposeBag = DisposeBag()
    
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
    func set(withViewModel viewModel: NewsDetailsViewModel) {
        self.viewModel = viewModel
        self.router = Router()
        self.router.viewController = self
    }
    
    
    
}

// MARK: Setup
private extension NewsDetailsViewController {
    
    /// setup things related to views set title and add pull to refrsh to table
    func setupViews() {
        showNavBar()
        setTitle()
    }
    /// Data binding
    func setupRx() {
        handleViewModelErrors()
    }
}
// MARK: Setup Methods
private extension NewsDetailsViewController {
    
    /// handel error msg from viewModel
    func handleViewModelErrors() {
        viewModel.errorSubject.subscribe({ [weak self] (event) in
            if let msg =  event.element {
                self?.router.showErrorAlert(msg: msg)
            }
        }).disposed(by: disposeBag)
    }
    
    func setTitle() {
        self.title = viewModel.getTitle()
    }
}
extension NewsDetailsViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            return getHeaderCell(tableView, indexPath)
        }
        else {
            return getContentCell(tableView)
        }
        
    }
    func getHeaderCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell:NewsListItemCell = tableView.dequeueReusableCell(withIdentifier: NewsListItemCell.identifier(), for: indexPath) as! NewsListItemCell
        let title = self.viewModel.getArticleTitle()
        let date = self.viewModel.getArticleTime()
        let source = self.viewModel.getArticleSource()
        let imageURL = self.viewModel.getArticleimageURL()
        cell.configure(with: title, date: date, source: source, imageURL: imageURL)
        
        return cell
    }
    
    fileprivate func getContentCell(_ tableView: UITableView) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "detailsCell")!
        cell.textLabel?.attributedText = self.viewModel.getArticleDetails()
        if (cell.textLabel?.attributedText?.string.isArabic) ?? false{
            cell.textLabel?.textAlignment = .right
        }
        else {
            cell.textLabel?.textAlignment = .left
        }
        return cell
    }
}
