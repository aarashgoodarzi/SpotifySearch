//
//  TrackCell.swift
//  SpotifySearch
//
//  Created by Arash Goodarzi on 10/30/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import UIKit

class TrackCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var singer: UILabel!
    @IBOutlet weak var album: UILabel!
    @IBOutlet weak var trackImage: UIImageView!
    var track: ServerModels.Response.TracksModel.Item?
    
    func set(track: ServerModels.Response.TracksModel.Item?) {
        self.track = track
        self.name.text = track?.name
        self.album.text = track?.album?.name
        self.trackImage.downloadImage(url: track?.album?.images?.first?.url)
    }

}
