//
//  PlaylistReponse.swift
//  Spotishare
//
//  Created by DO Florian on 3/26/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import Foundation

struct PlaylistReponse: Codable {
    let href: String
    let items: [PlaylistItem]
    let limit: Int
    let next: String
    let offset: Int
    let previous: Int?
    let total: Int
}

struct PlaylistItem: Codable {
    let collaborative: Bool
    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let images: [Image]
    let name: String
    let owner: Owner
    let primaryColor: Int?
    let itemPublic: Bool
    let snapshotID: String
    let type: ItemType
    let uri: String
    
    enum CodingKeys: String, CodingKey {
        case collaborative
        case externalUrls = "external_urls"
        case href, id, images, name, owner
        case primaryColor = "primary_color"
        case itemPublic = "public"
        case snapshotID = "snapshot_id"
        case type, uri
    }
}

struct ExternalUrls: Codable {
    let spotify: String
}

struct Image: Codable {
    let height: Int?
    let url: String
    let width: Int?
}

struct Owner: Codable {
    let displayName: String
    let externalUrls: ExternalUrls
    let href: String
    let id: ID
    let type: OwnerType
    let uri: URI
    
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case externalUrls = "external_urls"
        case href, id, type, uri
    }
}

enum ID: String, Codable {
    case sandy016 = "sandy016"
    case spotify = "spotify"
}

enum OwnerType: String, Codable {
    case user = "user"
}

enum URI: String, Codable {
    case spotifyUserSandy016 = "spotify:user:sandy016"
    case spotifyUserSpotify = "spotify:user:spotify"
}

enum ItemType: String, Codable {
    case playlist = "playlist"
}
