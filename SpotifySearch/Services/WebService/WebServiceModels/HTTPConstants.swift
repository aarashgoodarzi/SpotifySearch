//
//  HTTPConstants.swift
//  Kian Digital
//
//  Created by Mohammad Porooshani on 4/26/18.
//  Copyright © 2018 Mohammad Porooshani. All rights reserved.
//

import Foundation

extension HTTP {
    enum Method: String {
        
        case GET
        case POST
        case PUT
        case DELETE
        case HEAD
        case OPTIONS
        case PATCH
    }
    
    enum TimeOut: Double {
        
        case short = 15.0
        case normal = 30.0
        case long = 120.0
        case unlimited = 3_600.0
        
    }
    
    enum StatusCode: Int {
        case ok = 200
        case internalServerError = 500
        case created = 201
        case unauthorized = 401
        case forbidden = 403
        case notFound = 404
    }
    
    enum Headers {
        static let ContentType = "Content-Type"
        static let ContentLength = "Content-Length"
        static let Accept = "Accept"
        static let Authorization = "Authorization"
        static let UserAgent = "User-Agent"
        static let AcceptLanguage = "Accept-Language"
        static let ApplicationName = "Application-Name"
        static let deviceID = "Device-Id"
        static let ObjectsToken = "X-Objects-Token"
    }
    
    enum HeaderValues {
        static let ContentTypeValue = "application/json"
        static let AcceptValue = "application/json"
        static let basicAuthorizatoion = "Basic YnJvd3NlcjoxMjM0NTY="
        static let UserAgent = "Mobile"
        static let AcceptLanguage = "fa"
        static let applicationName = ""
        
    }
    
    //**
    enum Parameters {
        static let query = "q"
        static let type = "type"
    }
    
    //**
    enum ParametersValues {
        static let typeValue = "track"
    }
    
    enum ContentType {
        case any
        case json
        case protobuf
        case urlEncodedForm
        case multipartFormdata
        case text
        
        var value: String {
            switch self {
            case .any:
                return "*/*"
            case .json:
                return "application/json"
            case .protobuf:
                return "application/octet-stream"
            case .urlEncodedForm:
                return "application/x-www-form-urlencoded"
            case .multipartFormdata:
                return "multipart/form-data"
            case .text:
                return "text/plain"
            }
        }
    }
    
    
    //**
    static var baseHeaders: [String: String?] {
        return [HTTP.Headers.Authorization: TokenProvider.value]
    }
    
}





