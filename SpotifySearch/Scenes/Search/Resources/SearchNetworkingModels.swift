//
//  SearchNetworkingModels.swift
//  SpotifySearch
//
//  Created by Arash Goodarzi on 10/30/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//
import Foundation
extension ServerModels.Response {
    
    // MARK: - Tracks
    struct TracksModel : ServerModelProtocol {
        let tracks : Tracks?
        
        enum CodingKeys: String, CodingKey {
            case tracks = "tracks"
        }
        
        struct Tracks : ServerModelProtocol {
            let offset : Int?
            let next : String?
            let href : String?
            let limit : Int?
            let previous : String?
            let total : Int?
            let items : [Item]?
            
            enum CodingKeys: String, CodingKey {
                
                case offset = "offset"
                case next = "next"
                case href = "href"
                case limit = "limit"
                case previous = "previous"
                case total = "total"
                case items = "items"
            }
        }
        
        struct Item : ServerModelProtocol {
            let id : String?
            let name : String?
            let album : Album?
            let disc_number : Int?
            let track_number : Int?
            let artists : [Artists]?
            let href : String?
            let is_local : Bool?
            let popularity : Int?
            let available_markets : [String]?
            let type : String?
            let uri : String?
            let explicit : Bool?
            let preview_url : String?
            let duration_ms : Int?
            let external_urls : External_urls?
            let external_ids : External_ids?
            
            enum CodingKeys: String, CodingKey {
                
                case id = "id"
                case name = "name"
                case album = "album"
                case disc_number = "disc_number"
                case track_number = "track_number"
                case artists = "artists"
                case href = "href"
                case is_local = "is_local"
                case popularity = "popularity"
                case available_markets = "available_markets"
                case type = "type"
                case uri = "uri"
                case explicit = "explicit"
                case preview_url = "preview_url"
                case duration_ms = "duration_ms"
                case external_urls = "external_urls"
                case external_ids = "external_ids"
            }
        }
        
        struct Album : ServerModelProtocol {
            let id : String?
            let total_tracks : Int?
            let uri : String?
            let album_type : String?
            let artists : [Artists]?
            let href : String?
            let available_markets : [String]?
            let release_date_precision : String?
            let type : String?
            let images : [Images]?
            let release_date : String?
            let external_urls : External_urls?
            let name : String?
            
            enum CodingKeys: String, CodingKey {
                
                case id = "id"
                case total_tracks = "total_tracks"
                case uri = "uri"
                case album_type = "album_type"
                case artists = "artists"
                case href = "href"
                case available_markets = "available_markets"
                case release_date_precision = "release_date_precision"
                case type = "type"
                case images = "images"
                case release_date = "release_date"
                case external_urls = "external_urls"
                case name = "name"
            }
        }
        
        struct Artists : ServerModelProtocol {
            let uri : String?
            let id : String?
            let external_urls : External_urls?
            let href : String?
            let name : String?
            let type : String?
            
            enum CodingKeys: String, CodingKey {
                
                case uri = "uri"
                case id = "id"
                case external_urls = "external_urls"
                case href = "href"
                case name = "name"
                case type = "type"
            }
            
        }
        
        struct External_ids : ServerModelProtocol {
            let isrc : String?
            
            enum CodingKeys: String, CodingKey {
                
                case isrc = "isrc"
            }
        }
        
        struct External_urls : ServerModelProtocol {
            let spotify : String?
            
            enum CodingKeys: String, CodingKey {
                
                case spotify = "spotify"
            }
            
        }
        
        struct Images : ServerModelProtocol {
            let url : String?
            let width : Int?
            let height : Int?
            
            enum CodingKeys: String, CodingKey {
                
                case url = "url"
                case width = "width"
                case height = "height"
            }
        }
    }
    
}
