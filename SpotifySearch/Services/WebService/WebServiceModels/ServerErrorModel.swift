//
//  ServerErrorModel.swift
//  CustomNavBarTest
//
//  Created by Arash Goodarzi on 8/15/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import Foundation


struct ServerErrorModel: ServerModel {
    let messages: [String]?
    let statusCode: Int
}


