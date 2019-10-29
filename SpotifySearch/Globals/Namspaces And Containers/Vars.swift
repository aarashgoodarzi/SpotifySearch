//
//  Vars.swift
//  CustomNavBarTest
//
//  Created by Arash Goodarzi on 8/15/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import Foundation


extension Global.Vars {
    static let indicator: InidicatorProvider = {
        return Indoicator()
    }()
}
