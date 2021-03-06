//
//  SearchModels.swift
//  SpotifySearch
//
//  Created by Arash Goodarzi on 10/29/19.
//  Copyright (c) 2019 Arash Goodarzi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Search {
    
    enum Tracks {
        struct Request {
            let query: String
        }
        
        struct Response {
            let state: Result<[ServerModels.Response.TracksModel.Item],Error>
        }
        
        enum ViewModel {
            
            
            struct Success {
                let tracks: [ServerModels.Response.TracksModel.Item]
            }
            
            struct Failure {
                var message: String? = nil
            }
            
        }
    }
    
    enum SaveTrackInDataStore {
        struct Request {
            let track: ServerModels.Response.TracksModel.Item
        }
    }
}
