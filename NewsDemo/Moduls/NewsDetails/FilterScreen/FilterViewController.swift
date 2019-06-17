//
//  AlertViewController.swift
//  "NewsDemo
//
//  Created by Ali Adam on 6/17/19.
//  Copyright (c) 2019 Ali Adam. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FilterViewController: ViewController {
    
    // MARK: Variable
    private var viewModel: FilterViewModel!
    private let disposeBag = DisposeBag()
    
    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var okayButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRx()
    }
    
    // MARK: Methods
    
    /// inject the viewModel into the controller
    ///
    /// - Parameter viewModel: alert viewModel
    func set(withViewModel viewModel: FilterViewModel) {
        self.viewModel = viewModel
    }
    
    
}

// MARK: Setup
private extension FilterViewController {
    
    /// Data binding
    func setupRx() {
        bindViewModelData()
        handleOkayButtonTapAction()
        handleDismissButtonTapAction()
    }
    
    /// Bind viewmodel  list to table
    func bindViewModelData()  {
        self.viewModel.tableFilters.asObservable()
            .subscribe(onNext:{ list in
                self.tableView.reloadData()
            })
            .disposed(by:disposeBag)
        
        //        self.viewModel.msg
        //            .asObservable()
        //            .map { $0 }
        //            .bind(to:self.msgLabel.rx.attributedText)
        //            .disposed(by:disposeBag)
    }
    
    /// handle okay button tap to dismiss the screen
    func handleOkayButtonTapAction()  {
        okayButton.rx.tap
            .subscribe({ [weak self] _ in
                self?.dismiss(animated: true, completion:nil)
            }).disposed(by: disposeBag)
    }
    
    /// handle dismiss button tap to dismiss the screen when click the dim background
    func handleDismissButtonTapAction()  {
        dismissButton.rx.tap
            .subscribe({ [weak self] _ in
                self?.dismiss(animated: true, completion:nil)
            }).disposed(by: disposeBag)
    }
    
    
}
// MARK: - Table view data source

extension FilterViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsFor(section: section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleFor(section: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let filter = viewModel.filterOf(indexPath: indexPath)
        cell.textLabel?.text = filter.text
        cell.accessoryType = filter.checked ? .checkmark : .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.checkedFilterOf(indexPath: indexPath)
        tableView.reloadSections([indexPath.section], with: .automatic)
    }
    
    
}
