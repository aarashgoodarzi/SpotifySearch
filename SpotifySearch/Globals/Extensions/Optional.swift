//
//  Optional.swift
//  SpotifySearch
//
//  Created by Arash Goodarzi on 11/1/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import Foundation


//**
extension Optional where Wrapped == Bool {
    var getTrueOrFalse: Bool {
        return self ?? false
    }
}

//**
extension Optional where Wrapped == String {
    var getValue: String {
        return self ?? ""
    }
}

//**
extension Optional where Wrapped == String {
    var isBlank: Bool {
        return self.getValue.isEmpty
    }
}
