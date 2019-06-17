//
//  FilterList.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/17/19.
//  Copyright © 2019 AliAdam. All rights reserved.
//

import Foundation

class FilterList{
    class func getDefaultCountry() -> String{
        return "us"
    }
    class func getDefaultCategory() -> String{
        return ""
    }
    
    class func getCatsFilterList(selectedCategoryCode:String) -> [Filter]{
        let items = [Filter(text: "All News", value: "", checked: false),
                     Filter(text: "Business", value: "Business", checked: false),
                     Filter(text: "Entertainment", value: "Entertainment", checked: false),
                     Filter(text: "General", value: "General", checked: false),
                     Filter(text: "Health", value: "Health", checked: false),
                     Filter(text: "Science", value: "Science", checked: false),
                     Filter(text: "Sports", value: "Sports", checked: false),
                     Filter(text: "Technology", value: "Technology", checked: false)]
        for (_,item) in items.enumerated() {
            if item.value == selectedCategoryCode {
                item.checked = true
                break
            }
        }
        return items
    }
    class func getCountresFilterList(selectedCountryCode:String) -> [Filter]{
        let items = [Filter(text: "USA", value: "us", checked: false),
                     Filter(text: "Argentina", value: "ar", checked: false),
                     Filter(text: "Austria", value: "at", checked: false),
                     Filter(text: "Australia", value: "au", checked: false),
                     Filter(text: "Belgium", value: "be", checked: false),
                     Filter(text: "Bulgaria", value: "bg", checked: false),
                     Filter(text: "Brazil", value: "br", checked: false),
                     Filter(text: "Canada", value: "ca", checked: false),
                     Filter(text: "China", value: "cn", checked: false),
                     Filter(text: "Colombia", value: "co", checked: false),
                     Filter(text: "Cuba", value: "cu", checked: false),
                     Filter(text: "Czech Republic", value: "cz", checked: false),
                     Filter(text: "Germany", value: "de", checked: false),
                     Filter(text: "Egypt", value: "eg", checked: false),
                     Filter(text: "France", value: "fr", checked: false),
                     Filter(text: "Great Britain", value: "gb", checked: false),
                     Filter(text: "Greece", value: "gr", checked: false),
                     Filter(text: "Hong Kong", value: "hk", checked: false),
                     Filter(text: "Hungary", value: "hu", checked: false),
                     Filter(text: "Indonesia", value: "id", checked: false),
                     Filter(text: "Ireland", value: "ie", checked: false),
                     Filter(text: "Israel", value: "il", checked: false),
                     Filter(text: "India", value: "in", checked: false),
                     Filter(text: "Italy", value: "it", checked: false),
                     Filter(text: "Japan", value: "jp", checked: false),
                     Filter(text: "South Korea", value: "kr", checked: false),
                     Filter(text: "Lithuania", value: "lt", checked: false),
                     Filter(text: "Latvia", value: "lv", checked: false),
                     Filter(text: "Morocco", value: "ma", checked: false),
                     Filter(text: "Mexico", value: "mx", checked: false),
                     Filter(text: "Malaysia", value: "my", checked: false),
                     Filter(text: "Nigeria", value: "ng", checked: false),
                     Filter(text: "Netherlands", value: "nl", checked: false),
                     Filter(text: "Norway", value: "no", checked: false),
                     Filter(text: "New Zealand", value: "nz", checked: false),
                     Filter(text: "Philippines", value: "ph", checked: false),
                     Filter(text: "Poland", value: "pl", checked: false),
                     Filter(text: "Portugal", value: "pt", checked: false),
                     Filter(text: "Romania", value: "ro", checked: false),
                     Filter(text: "Serbia", value: "rs", checked: false),
                     Filter(text: "Russia", value: "ru", checked: false),
                     Filter(text: "Saudi Arabia", value: "sa", checked: false),
                     Filter(text: "Singapore", value: "sg", checked: false),
                     Filter(text: "Sweden", value: "se", checked: false),
                     Filter(text: "Switzerland", value: "ch", checked: false),
                     Filter(text: "Slovenia", value: "si", checked: false),
                     Filter(text: "Slovakia", value: "sk", checked: false),
                     Filter(text: "South Africa", value: "za", checked: false),
                     Filter(text: "Thailand", value: "th", checked: false),
                     Filter(text: "Turkey", value: "tr", checked: false),
                     Filter(text: "Taiwan", value: "tw", checked: false),
                     Filter(text: "UAE", value: "ae", checked: false),
                     Filter(text: "Ukraine", value: "ua", checked: false),
                     Filter(text: "Venezuela", value: "ve", checked: false)]
        
        for (_,item) in items.enumerated() {
            if item.value == selectedCountryCode {
                item.checked = true
                break
            }
        }
        
        return items
    }
}
