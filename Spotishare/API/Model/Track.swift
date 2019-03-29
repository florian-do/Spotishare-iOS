//
//  Track.swift
//  Spotishare
//
//  Created by DO Florian on 3/29/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import Foundation

struct Track: Codable {
    let album: Album
    let artists: [Artist]
    let name: String
    let uri: String
}
