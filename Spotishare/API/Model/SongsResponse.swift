//
//  SongsResponse.swift
//  Spotishare
//
//  Created by DO Florian on 3/29/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import Foundation

struct SongsReponse: Codable {
    let items: [SongItem]
}

struct SongItem: Codable {
    let track: Track
}

struct Album: Codable {
    let name: String
}

struct Artist: Codable {
    let href: String?
    let id: String?
    let uri: String?
    let name, type: String
}
