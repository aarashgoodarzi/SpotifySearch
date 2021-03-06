//
//  TokenProvider.swift
//  SpotifySearch
//
//  Created by Arash Goodarzi on 10/30/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import Foundation

struct TokenProvider {
    
    static var value: String? {
        guard let tokenData = KeychainProvider.valueFor(key: Global.Keys.accessToken) as? Data else {
            return nil
        }
        let token = String(decoding: tokenData, as: UTF8.self)
        return token
    }
    
    //**
    static func save(token: String?) {
        guard let token = token else {
            return
        }
        let bearerToken = "Bearer " + token
        #if Debug
        print(bearerToken)
        #endif
        KeychainProvider.set(value: bearerToken, for: Global.Keys.accessToken)
    }
    
    //**
    static func delete() {
        KeychainProvider.removeValueFor(key: Global.Keys.accessToken)
    }
    
}
