//
//  NetworkResponse.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright © 2019 Ali Adam. All rights reserved.
//

import Foundation

/// respnse enumration
///
/// - error: in case error occure pass the error
/// - success: in success case pass the object to it
enum Response<Element> {
    case error(Error)
    case success(Element)
}
