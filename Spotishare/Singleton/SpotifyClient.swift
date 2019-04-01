//
//  SpotifyClient.swift
//  Spotishare
//
//  Created by DO Florian on 3/26/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import Foundation

class SpotifyClient: NSObject, SPTSessionManagerDelegate, SPTAppRemoteDelegate, SPTAppRemotePlayerStateDelegate {
    static let instance = SpotifyClient()
    private override init() {
        
    }
    
    var mDelegate: SpotifyDelegate?
    var isMaster: Bool = false
    
    let spotifyRedirectURL = URL(string: Const.callback ?? "")!
    lazy var configuration = SPTConfiguration(
        clientID: Const.apiKey ?? "", redirectURL: spotifyRedirectURL
    )
    
    lazy var sessionManager: SPTSessionManager = {
        if let tokenSwapURL = URL(string: Const.tokenSwapURL ?? ""),
            let tokenRefreshURL = URL(string: Const.tokenRefreshURL ?? "") {
            self.configuration.tokenSwapURL = tokenSwapURL
            self.configuration.tokenRefreshURL = tokenRefreshURL
            self.configuration.playURI = nil
        }
        
        let manager = SPTSessionManager(configuration: self.configuration, delegate: self)
        return manager
    }()
    
    open lazy var appRemote: SPTAppRemote = {
        let appRemote = SPTAppRemote(configuration: self.configuration, logLevel: .debug)
        appRemote.delegate = self
        return appRemote
    }()
    
    func sessionManager(manager: SPTSessionManager, didInitiate session: SPTSession) {
        
        print(session.accessToken)
        //sessionManager.renewSession()
        if self.isMaster {
            self.appRemote.connectionParameters.accessToken = session.accessToken
            DispatchQueue.main.async {
                self.appRemote.connect()
            }
        }
        mDelegate?.spotifyDidSuccessfullyConnect(isMaster: self.isMaster)
    }
    
    func sessionManager(manager: SPTSessionManager, didFailWith error: Error) {
        print("sessionManager: fail", error)
    }
    
    func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
        print("appRemoteDidEstablishConnection: connected")
    }
    
    func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {
        print("appRemote: failed")
    }
    
    func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {
        print("appRemote: failed with error")
    }
    
    func playerStateDidChange(_ playerState: SPTAppRemotePlayerState) {
        print("playerStateDidChange: player state changed")
        debugPrint("Track name: %@", playerState.track.name)
    }
    
    public func connect(isMaster: Bool = false, vc: UIViewController? = nil) {
        self.isMaster = isMaster
        let scope: SPTScope = [.appRemoteControl, .playlistReadPrivate, .streaming]
        
        if #available(iOS 11, *) {
            self.sessionManager.initiateSession(with: scope, options: .clientOnly)
        } else {
            if vc != nil {
                self.sessionManager.initiateSession(with: scope, options: .clientOnly, presenting: vc!)
            }
        }
    }
}

protocol SpotifyDelegate: class {
    func spotifyDidSuccessfullyConnect(isMaster: Bool)
}
