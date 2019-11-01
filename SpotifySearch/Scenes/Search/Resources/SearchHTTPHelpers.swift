//
//  SearchHTTPHelpers.swift
//  SpotifySearch
//
//  Created by Arash Goodarzi on 10/30/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import Foundation

extension HTTP.Heplers {
    
    static func search(trackName: String) -> HTTP.Request<ServerModels.Response.TracksModel> {
            let url: URLPath = .baseURL / .search 
        let params = [HTTP.Parameters.query: trackName, HTTP.Parameters.type:HTTP.ParametersValues.typeValue]
        let headers = HTTP.baseHeaders
            let httpReq = HTTP.Request<ServerModels.Response.TracksModel>(method: .GET, url: url, parameters: params, bodyMessage: nil, serializedBody: nil, headers: headers, timeOut: .normal
                , acceptType: .json, contentType: .json)
            return httpReq
    }
}
