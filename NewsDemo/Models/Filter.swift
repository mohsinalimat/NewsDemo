//
//  Filter.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/17/19.
//  Copyright © 2019 AliAdam. All rights reserved.
//

import Foundation

class Filter {
    var text: String
    var value: String
    var checked: Bool
    init(text: String, value: String, checked: Bool) {
        self.text = text
        self.value = value
        self.checked = checked
    }
}
