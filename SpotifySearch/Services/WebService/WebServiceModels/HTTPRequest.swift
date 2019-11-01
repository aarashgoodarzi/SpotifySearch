//
//  RequestModel.swift
//  CustomNavBarTest
//
//  Created by Arash Goodarzi on 8/15/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: Any]


extension HTTP {
    struct Request<T: ServerModelProtocol> {
        
        let httpMethod: HTTP.Method
        let url: URLPath
        let responseType: T.Type
        let timeout: HTTP.TimeOut
        let parameters: JSONDictionary?
        let bodyMessage: ServerModelProtocol?
        let serializedBody: Data?
        let headers: [String: String?]?
        let accept: HTTP.ContentType
        let contentType: HTTP.ContentType
        let validStatusCodes: ClosedRange<Int>
        
        init(method: HTTP.Method, url: URLPath, parameters: JSONDictionary? = nil, bodyMessage: ServerModelProtocol? = nil, serializedBody: Data? = nil, headers: [String: String?]? = nil, timeOut: HTTP.TimeOut = .normal, acceptType: HTTP.ContentType = .json, contentType: HTTP.ContentType = .json, validStatusCodes: ClosedRange<Int> = 200...300) {
            self.httpMethod = method
            self.url = url
            self.timeout = timeOut
            self.parameters = parameters
            self.headers = headers
            self.accept = acceptType
            self.contentType = contentType
            self.bodyMessage = bodyMessage
            self.serializedBody = serializedBody
            self.responseType = T.self
            self.validStatusCodes = validStatusCodes
        }
    }
    
}
