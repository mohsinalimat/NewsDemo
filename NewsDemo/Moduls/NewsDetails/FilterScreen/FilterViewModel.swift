//
//  AlertViewModel.swift
//  "NewsDemo
//
//  Created by Ali Adam on 6/17/19.
//  Copyright (c) 2019 Ali Adam. All rights reserved.
//

import RxSwift
import RxRelay

class FilterViewModel: ViewModel {
    //MARK: Variables
    private var selectedCountryCode:BehaviorRelay<String>
    private var selectedCategoryCode:BehaviorRelay<String>
    
    
    struct TableFilter {
        var sectionTitle : String!
        var rows : [Filter]!
    }
    var tableFilters =  BehaviorRelay<[TableFilter]>(value:[])
    
    //MARK: Methods
    init(selectedCountryCode:BehaviorRelay<String>,selectedCategoryCode:BehaviorRelay<String>) {
        self.selectedCountryCode = selectedCountryCode
        self.selectedCategoryCode = selectedCategoryCode
        super.init()
        setup()
    }
    func setup() {
        
        tableFilters.accept([
            TableFilter(sectionTitle: LocalizableWords.selectCat, rows: FilterList.getCatsFilterList(selectedCategoryCode: selectedCategoryCode.value)),TableFilter(sectionTitle: LocalizableWords.selectCountry, rows: FilterList.getCountresFilterList(selectedCountryCode: selectedCountryCode.value))])
        
    }
    func numberOfRowsFor(section: Int) -> Int {
        return tableFilters.value[section].rows.count
    }
    func numberOfSections() -> Int {
        return tableFilters.value.count
    }
    
    func filterOf(indexPath: IndexPath)-> Filter {
        return tableFilters.value[indexPath.section].rows[indexPath.row]
    }
    func checkedFilterOf(indexPath: IndexPath) {
        if !filterOf(indexPath: indexPath).checked {
            for item in tableFilters.value[indexPath.section].rows {
                item.checked = false
            }
            filterOf(indexPath: indexPath).checked = true
            switch titleFor(section: indexPath.section) {
                
            case LocalizableWords.selectCountry: selectedCountryCode.accept(filterOf(indexPath: indexPath).value)
            case LocalizableWords.selectCat: selectedCategoryCode.accept(filterOf(indexPath: indexPath).value)
            default:
                break
            }
        } else {
            filterOf(indexPath: indexPath).checked = false
        }
    }
    func titleFor(section: Int) -> String {
        return tableFilters.value[section].sectionTitle
    }
}

