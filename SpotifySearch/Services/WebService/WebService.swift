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
    static func request<T: ServerModelProtocol>(_ request: HTTP.Request<T>, completion: @escaping (_ result: Result<T>) -> Void )
    static func cancelAllRequests()
}

//MARK: - Web Service
public enum WebServcie: WebServiceProvider {
    
    //MARK: Request
    static func request<T: ServerModelProtocol>(_ request: HTTP.Request<T>, completion: @escaping (_ result: Result<T>) -> Void ) {
        
        guard let url = request.url.getURL, let httpMethod = HTTPMethod(rawValue: request.httpMethod.rawValue) else {
            return
        }
        
        guard let headers = request.headers as? HTTPHeaders else {
            return
        }
        Alamofire.request(url, method: httpMethod, parameters: request.parameters, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode: request.validStatusCodes)
            .responseJSON { response in
            
                //no connection
            guard let data = response.data else {
                let error = ServerModels.NoConnectionError()
                completion(Result.failure(error))
                Global.Funcs.log("No data received!")
                return
            }
            
            switch response.result {
                
            case .success:
                
                do {
                    let decodedObject = try JSONDecoder().decode(T.self, from: data)
                    completion(Result.success(decodedObject))
                } catch let error {
                        let message = "could not decode to \(T.self) \n \(error.localizedDescription)"
                        Global.Funcs.log(message)
                        completion(Result.failure(error))
                }
                
            case .failure:
                do {
                    
                    //token expired
                    let statusCode = response.response?.statusCode ?? 0
                    if statusCode == HTTP.StatusCode.unauthorized.rawValue {
                        print("\n --- Token Expired --- \n")
                        goToLogin()
                        return
                    }
                    
                    //server Error
                    let serverErrorModel = try JSONDecoder().decode(ServerModels.ServerErrorModel.self, from: data)
                    completion(Result.failure(serverErrorModel))
                } catch let error {
                    Global.Funcs.log("No response from server for: \n \(request.url.component) \n error : \(error)")
                    completion(Result.failure(error))
                }
                
            }
        }
    }
    

    //MARK: cancel All Requests
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
    
    //MARK: get access token
    static func goToLogin() {
        
        TokenProvider.delete()
        let searchVc = UIApplication.shared.keyWindow?.rootViewController?.topViewController
        DispatchQueue.main.async {
            searchVc?.dismiss(animated: true, completion: nil)
        }
        
    }
}
