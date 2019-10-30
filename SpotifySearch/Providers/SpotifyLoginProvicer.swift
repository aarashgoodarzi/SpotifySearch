//
//  SpotifyLoginProvicer.swift
//  SpotifySearch
//
//  Created by Arash Goodarzi on 10/30/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import SpotifyLogin

protocol SpotifyLoginDelegate: AnyObject {
    func loginSuccessfull()
}

class SpotifyLoginProvider {
    
    static weak var delegate: SpotifyLoginDelegate?
    
    //**
    static var redirectURL: URL {
        guard let redirectURL: URL = URL(string: "dpg://mydigipay/") else {
            fatalError("no redirectURL!")
        }
        return redirectURL
    }
    
    //**
    static var clientID: String {
        return "a30e4faff86a4bf0b88202265fd57929"
    }
    
    //**
    static var clientSecret: String {
        return "0cb8af54aa63494fa620caf2d24c2a42"
    }
    
    //**
    static func configLogin() {
        SpotifyLogin.shared.configure(clientID: clientID,
                                      clientSecret: clientSecret,
                                      redirectURL: redirectURL)
    }
    
    //**
    static func isURLHandeled(_ url: URL) -> Bool {
        return SpotifyLogin.shared.applicationOpenURL(url) { _ in }
    }
    
    //**
    static func getLoginButton(for viewController: UIViewController & SpotifyLoginDelegate) -> SpotifyLoginButton {
        
        SpotifyLoginProvider.delegate = viewController
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(loginSuccessful),
                                               name: .SpotifyLoginSuccessful,
                                               object: nil)
        let scopes: [Scope] = [.streaming, .userReadTop, .playlistReadPrivate, .userLibraryRead]
        let button = SpotifyLoginButton(viewController: viewController, scopes: scopes)
        return button
    }
    
    //**
    //this method implemented to make SpotifyLogin actions solid. and also separate token managmnt from interactor.
    static func checkLoginState(completion: @escaping (_ isUserLogedIn: Bool,_ error: Error?) -> Void)  {
         SpotifyLogin.shared.getAccessToken { (token, error) in
            TokenProvider.save(token: token)
            let isUserLogedIn = token != nil && error == nil
            completion(isUserLogedIn, error)
        }
    }
    
    
    
    //**
    @objc static func loginSuccessful() {
        NotificationCenter.default.removeObserver(self)
        SpotifyLoginProvider.delegate?.loginSuccessfull()
    }
    
    
}
