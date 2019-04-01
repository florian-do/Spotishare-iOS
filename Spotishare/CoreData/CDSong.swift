//
//  CDSong.swift
//  Spotishare
//
//  Created by DO Florian on 3/29/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import Foundation

struct CDSong {
    var className: String {
        return String(describing: CDSong.self)
    }
}

enum EntitySong: String {
    case entity = "Song"
    case title = "title"
    case uri = "uri"
    case id = "id"
    case albumName = "albumName"
    case artistsName = "artistsName"
}

//enum CDSong: String {
//    case entity = "Song"
//    case title = "title"
//    case uri = "uri"
//    case id = "id"
//    case albumName = "albumName"
//    case artistsName = "artistsName"
//}
