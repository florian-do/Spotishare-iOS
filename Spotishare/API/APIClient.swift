//
//  APIClient.swift
//  Spotishare
//
//  Created by DO Florian on 3/26/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import Alamofire

class APIClient {
    
    static func getPlaylist(completion: @escaping (PlaylistReponse?) -> ()) {
        AF.request(APIRouter.playlist)
            .responseDecodable { (result: DataResponse<PlaylistReponse>) in
                completion(result.value)
        }
    }
    
    static func getPlaylistByID(id: String, completion: @escaping (SongsReponse?) -> ()) {
        AF.request(APIRouter.playlistByID(id: id))
            .responseDecodable { (result: DataResponse<SongsReponse>) in
                //print(result.debugDescription)
                //print(result.response?.httpHeaders.value(for: "Cache-Control"))
                completion(result.value)
        }
    }
    
    static func encodeUrl(paramOrKey: String?) -> String? {
        var allowedQueryParamAndKey = NSCharacterSet.urlQueryAllowed
        allowedQueryParamAndKey.remove(charactersIn: ";/?:@&=+$, ")
        return paramOrKey?.addingPercentEncoding(withAllowedCharacters: allowedQueryParamAndKey)
    }
}
