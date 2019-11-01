//
//  ServerErrorModel.swift
//  CustomNavBarTest
//
//  Created by Arash Goodarzi on 8/15/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import Foundation


extension ServerModels {
    struct ServerErrorModel: Codable, Error {
        let error: Error
        
        // MARK: - Error
        struct Error: Codable {
            let status: Int
            let message: String
        }
    }
    
    //**
    struct NoConnectionError: Error {
        let message: String = "No connection!"
    }
}
