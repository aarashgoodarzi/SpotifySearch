//
//  Funcs.swift
//  CustomNavBarTest
//
//  Created by Arash Goodarzi on 8/15/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import UIKit

//Mark: - alert
extension Global.Funcs {
    static func showAlert(message: String?) {
        guard let message = message else {
            return
        }
        print(message)
    }
    
    static func showNoConnectionAlert() {
        print("no connection!")
    }
}

//MARK: - log
extension Global.Funcs {
    
    static func log(_ message: Any, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column, color: LogingColor = .orange) {
        print("*** \n \n ","\(file) : \(function) : \(line) : \(column) - \(message)","\n \n ***")
    }
    
     enum LogingColor: String {
        case yellow = ""
        case orange = "."
        case green = " "
    }
}



