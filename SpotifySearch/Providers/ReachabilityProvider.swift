//
//  ReachabilityProvider.swift
//  SpotifySearch
//
//  Created by Arash Goodarzi on 10/30/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import Foundation
import Reachability

class ReachabilityProvider {
    
    static func noConnection(completion: @escaping () -> Void)  {
        let reachability = try? Reachability()
        reachability?.whenUnreachable = { _ in
            completion()
        }
    }
    
    //**
    static func hasConnection(completion: @escaping () -> Void)  {
        let reachability = try? Reachability()
        reachability?.whenReachable = { _ in
            completion()
        }
    }
}
