//
//  URLPath.swift
//  CustomNavBarTest
//
//  Created by Arash Goodarzi on 8/15/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import Foundation

//MARK: Base URL
private var _baseURL: String {
    guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
        fatalError("Could not find base url in config file")
    }
    return baseURL
}


//MARK: URLPath
struct URLPath {
    
    let component: String
    var getURL: URL? {
        return URL(string: component)
    }
    
    private init(_ rawValue: String) {
        self.component = rawValue
    }
    
    //MARK: Operators
    
    static func / (lhs: URLPath, rhs: URLPath) -> URLPath {
        return URLPath("\(lhs.component)/\(rhs.component)")
    }
    
    static func / (lhs: URLPath, rhs: String) -> URLPath {
        return lhs / URLPath(rhs)
    }
    
    static func /<T: Numeric> (lhs: URLPath, rhs: T) -> URLPath {
        return lhs / URLPath("\(rhs)")
    }
    
    
    //MARK: - URLs
    private (set) static var baseURL = URLPath(_baseURL)
    static let search = URLPath("search")
    
}
