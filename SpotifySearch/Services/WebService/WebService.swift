//
//  DataService.swift
//  CustomNavBarTest
//
//  Created by Arash Goodarzi on 8/15/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import Foundation
import Alamofire



//MARK: - Web Service Provider
protocol WebServiceProvider {
    static func request<T: Codable>(_ request: HTTPRequest<T>, completion: @escaping (_ result: Result<T>, _ statusCode: Int) -> Void )
    static func cancelAllRequests()
}

//MARK: - Web Service
public enum WebServcie: WebServiceProvider {
    
    //MARK: Request
    static func request<T: Codable>(_ request: HTTPRequest<T>, completion: @escaping (_ result: Result<T>, _ statusCode: Int) -> Void ) {
        
        Alamofire.request(URL(fileURLWithPath: "asd"), method: HTTPMethod.get, parameters: [:], encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result {
            case .success:
                
                guard let data = response.data else {
                    Global.Funcs.log("No data received!")
                    return
                }
                do {
                    let decodedObject = try JSONDecoder().decode(T.self, from: data)
                    let statusCode = response.response?.statusCode ?? 0
                    completion(Result.success(decodedObject), statusCode)
                } catch let error {
                    
                    let message = "could not decode to \(T.self) \n \(error.localizedDescription)"
                    Global.Funcs.log(message)
                    let statusCode = response.response?.statusCode ?? 0
                    completion(Result.failure(error), statusCode)
                }
                
            case .failure(let error):
                Global.Funcs.log("No response from server for: \n \(request.url) \n \(error.localizedDescription)")
                let statusCode = response.response?.statusCode ?? 0
                completion(Result.failure(error), statusCode)
            }
        }
    }
    
    //MARK: cancelAllRequests
    static func cancelAllRequests() {
        
        if #available(iOS 9.0, *) {
            Alamofire.SessionManager.default.session.getAllTasks { (tasks) in
                tasks.forEach{ $0.cancel() }
            }
        } else {
            Alamofire.SessionManager.default.session.getTasksWithCompletionHandler { (sessionDataTask, uploadData, downloadData) in
                sessionDataTask.forEach { $0.cancel() }
                uploadData.forEach { $0.cancel() }
                downloadData.forEach { $0.cancel() }
            }
        }
    }
}

func hjjkk() {
    WebServcie.request(HTTPRequest<URL as! Codable>) {_,_ in
        
    }
        
}
