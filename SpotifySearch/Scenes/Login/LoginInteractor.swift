//
//  LoginInteractor.swift
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

protocol LoginBusinessLogic: AnyObject {
    
}

protocol LoginDataStore {
    
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    
    var presenter: LoginPresentationLogic?
    
    
    //end of class
}
