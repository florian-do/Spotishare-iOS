//
//  APIRouter.swift
//  Spotishare
//
//  Created by DO Florian on 3/26/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case playlist
    
    private var method: HTTPMethod {
        switch self {
        case .playlist:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .playlist:
            return "me/playlists"
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .playlist:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Const.API.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(Const.API.ContentType.json.rawValue, forHTTPHeaderField: Const.API.HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(Const.API.ContentType.json.rawValue, forHTTPHeaderField: Const.API.HTTPHeaderField.contentType.rawValue)
        
        if let auth = SpotifyClient.instance.sessionManager.session?.accessToken {
            urlRequest.setValue("Bearer "+auth, forHTTPHeaderField: Const.API.HTTPHeaderField.authentication.rawValue)
        }
        
        if let param = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: param, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
