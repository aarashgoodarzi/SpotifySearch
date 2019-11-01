//
//  KeychainProvider.swift
//  SpotifySearch
//
//  Created by Arash Goodarzi on 10/30/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import Foundation

import Security



struct KeychainProvider {
    
    // Arguments for the keychain queries
    private static let kSecClassValue = String(kSecClass)
    private static let kSecAttrAccountValue = String(kSecAttrAccount)
    private static let kSecValueDataValue = String(kSecValueData)
    private static let kSecClassGenericPasswordValue = String(kSecClassGenericPassword)
    private static let kSecAttrServiceValue = String(kSecAttrService)
    private static let kSecMatchLimitValue = String(kSecMatchLimit)
    private static let kSecReturnDataValue = String(kSecReturnData)
    private static let kSecMatchLimitOneValue = String(kSecMatchLimitOne)
    
    static func valueFor(key: String) -> Any? {
        
        let keychainQuery: [String: Any] = [kSecClassValue: kSecClassGenericPasswordValue,
                                            kSecAttrServiceValue: Global.Constants.KeychainServiceValue,
                                            kSecAttrAccountValue: key,
                                            kSecReturnDataValue: kCFBooleanTrue as Any,
                                            kSecMatchLimitValue: kSecMatchLimitOneValue]
        
        var value: AnyObject?
        let status: OSStatus = SecItemCopyMatching(keychainQuery as CFDictionary, &value)
        if status == errSecSuccess {
            return value as Any
        }
        return nil
    }
    
    //**
    static private func convertValueToData(value: Any?) -> Data? {
        var data: Data?
        switch value {
        case is String:
            guard let string = value as? String else {
                return nil
            }
            data = Data(string.utf8)
        case is Int:
            guard let int = value as? Int else {
                return nil
            }
            data = Data(String(int).utf8)
        case is Double:
            guard let double = value as? Double else {
                return nil
            }
            data = Data(String(double).utf8)
        case is Data:
            guard let dataValue = value as? Data else {
                return nil
            }
            data = dataValue
        default:
            print("not supported")
            break
        }
        
        return data
    }
    
    //**
    static func set(value: Any?,for key: String) {
        
        guard let data = convertValueToData(value: value) else {
            return
        }
        let keychainQuery: [String: Any] = [kSecClassValue: kSecClassGenericPasswordValue,
                                            kSecAttrServiceValue: Global.Constants.KeychainServiceValue,
                                            kSecAttrAccountValue: key,
                                            kSecValueDataValue: data]
        SecItemDelete(keychainQuery as CFDictionary)
        let status = SecItemAdd(keychainQuery as CFDictionary, nil)
        print("secure item added:",status == errSecSuccess)
    }
    
    static func removeValueFor(key: String) {
        let keychainQuery: [String: Any] = [kSecClassValue: kSecClassGenericPasswordValue,
                                            kSecAttrServiceValue: Global.Constants.KeychainServiceValue,
                                            kSecAttrAccountValue: key]
        let status = SecItemDelete(keychainQuery as CFDictionary)
        print("secure item deleted:",status == errSecSuccess)
    }
}

//extend keys
extension Global.Keys {
    static let accessToken = "accessToken"
    static let firstRun = "firstRun"
}
