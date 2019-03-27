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
}
