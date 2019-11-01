//
//  Seed.swift
//  SpotifySearch
//
//  Created by Arash Goodarzi on 11/1/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import Foundation

extension Seed {
    
    enum Search {
        
        static let aTrack = ServerModels.Response.TracksModel.Item(id: "15161611", name: "test0", album: nil, disc_number: nil, track_number: nil, artists: nil, href: nil, is_local: nil, popularity: 213, available_markets: nil, type: nil, uri: nil, explicit: true, preview_url: nil, duration_ms: nil, external_urls: nil, external_ids: nil)
        
        static let someTracks: [ServerModels.Response.TracksModel.Item] = [
            Search.aTrack,
            Search.aTrack,
            Search.aTrack,
            Search.aTrack,
            Search.aTrack,
        ]
    }
}
