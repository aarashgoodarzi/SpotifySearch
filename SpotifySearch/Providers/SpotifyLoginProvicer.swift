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
        return "ba05b9cd59634cefa8493ac961d76ed6"
    }
    
    //**
    static var clientSecret: String {
        return "ba05b9cd59634cefa8493ac961d76ed6"
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
    @objc func loginSuccessful() {
        NotificationCenter.default.removeObserver(self)
        SpotifyLoginProvider.delegate?.loginSuccessfull()
    }
    
    
}
