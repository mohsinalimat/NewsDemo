//
//  NetworkProvider.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright © 2019 Ali Adam. All rights reserved.
//

import Alamofire
class NetworkProvider {
    static let shared = NetworkProvider()
    static let timeout: TimeInterval = 30.0
    let alamofireManager: SessionManager

    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = NetworkProvider.timeout
        configuration.timeoutIntervalForRequest = NetworkProvider.timeout
        alamofireManager = SessionManager(configuration: configuration)
    }

    
    @discardableResult func getNewsList(with parameters:Parameters, completionHandler: @escaping (Response<NewsList>) -> ()) -> DataRequest {
        let request = alamofireManager.request(NetworkRouter.getNewsList(parameters))
        request.responseData { [weak self] response in
            if let result: Response<NewsList> = self?.getResult(responseData: response) {
            completionHandler(result)
            }
        }
        return request
    }
    
    
   
    
    
    private func getResult<T: Codable>(responseData: DataResponse<Data>) -> Response<T> {
        let decoder = JSONDecoder()
        let result : Result<T> = decoder.decodeResponse(from: responseData)
        switch result {
        case .success(let value):
            return .success(value)
        case .failure(let error):
            return .error(error)
        }
    }
}
