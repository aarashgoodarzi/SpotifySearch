//
//  UIImage.swift
//  SpotifySearch
//
//  Created by Arash Goodarzi on 10/31/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func downloadImage(url: String?) {
        guard let urlString =  url  else {
            return
        }
        guard let url = URL(string: urlString) else {
            return
        }
        self.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "logo.pdf"))
    }
}
