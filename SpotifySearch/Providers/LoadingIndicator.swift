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
        print("loading started ....")
    }
    
    func stop() {
         print("loading stoped.")
    }
    
    func stop(withMessage: String) {
        print("loading stoped:  \(withMessage)")
    }
    
    func start(withMessage: String) {
        print("loadind starteg:  \(withMessage)")
    }
    
    
}


//if in the future Indicator changes there's no need to change Global.Vars.indicator.start() in other classes



