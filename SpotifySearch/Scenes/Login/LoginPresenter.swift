//
//  LoginPresenter.swift
//  SpotifySearch
//
//  Created by Arash Goodarzi on 10/29/19.
//  Copyright (c) 2019 Arash Goodarzi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginPresentationLogic: AnyObject {
    func presentCheckLoginState(response: Login.CheckState.Response)
}

class LoginPresenter: LoginPresentationLogic {
    
    weak var viewController: LoginDisplayLogic?
    
    func presentCheckLoginState(response: Login.CheckState.Response) {
        
        guard let state = response.state else {
            let viewModel = Login.CheckState.ViewModel.Failure(message: nil)
            viewController?.displayNoConnectionCheckLoginState(viewModel: viewModel)
            return
        }
        switch state {
        case .success(let isUserLogedIn):
            
            let viewModel = Login.CheckState.ViewModel.Success(isUserLogedIn: isUserLogedIn)
            viewController?.displaySuccessCheckLoginState(viewModel: viewModel)
            
        case .failure(let error):
            
            let viewModel = Login.CheckState.ViewModel.Failure(message: error.localizedDescription)
            viewController?.displayServerErrorCheckLoginState(viewModel: viewModel)
        }
    }
    //end of class
}
