//
//  Const.swift
//  Spotishare
//
//  Created by DO Florian on 3/25/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import Foundation

class Const {
    static var apiKey: String? {
        return Bundle.main.object(forInfoDictionaryKey: "Spotify Api Key") as? String
    }
    
    static var callback: String? {
        return Bundle.main.object(forInfoDictionaryKey: "Spotify Callback") as? String
    }
    
    static var tokenSwapURL: String? {
        return Bundle.main.object(forInfoDictionaryKey: "Token Swap URL") as? String
    }
    
    static var tokenRefreshURL: String? {
        return Bundle.main.object(forInfoDictionaryKey: "Token Refresh URL") as? String
    }
    
    static var defaultPlayURI: String {
        return "spotify:track:6VSaNvPPagk4U5Skxp6XfV"
    }
    
    struct API {
        static let baseURL = "https://api.spotify.com/v1"
        
        enum HTTPHeaderField: String {
            case authentication = "Authorization"
            case contentType = "Content-Type"
            case acceptType = "Accept"
            case acceptEncoding = "Accept-Encoding"
        }
        
        enum ContentType: String {
            case json = "application/json"
        }
    }
}
