//
//  AppDelegate.swift
//  SpotifySearch
//
//  Created by Arash Goodarzi on 10/29/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import UIKit
import Bagel


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        checkFirstRun()
        #if DEBUG
        Bagel.start()
        #endif
        SpotifyLoginProvider.configLogin()
        return true
    }

    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return SpotifyLoginProvider.isURLHandeled(url)
    }
    
    //**
    func checkFirstRun() {
        let isFirstRun = (UserDefaults.standard.value(forKey: Global.Keys.firstRun) as? Bool) ?? true
        if isFirstRun {
            TokenProvider.delete()
            UserDefaults.standard.set(false, forKey: Global.Keys.firstRun)
        }
    }

}



