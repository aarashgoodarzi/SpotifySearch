//
//  Loading.swift
//  CustomNavBarTest
//
//  Created by Arash Goodarzi on 8/13/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import Foundation

protocol InidicatorProvider {
    func start()
    func stop()
    func stop(withMessage: String)
    func start(withMessage: String)
}


class Indoicator: InidicatorProvider {
    
    func start() {
        print("loadind started ....")
    }
    
    func stop() {
         print("loadind stoped.")
    }
    
    func stop(withMessage: String) {
        print("loadind stoped:  \(withMessage)")
    }
    
    func start(withMessage: String) {
        print("loadind started:  \(withMessage)")
    }
    
    
}


//if in the future Indicator changes there's no need to change Global.Vars.indicator.start() in other classes



