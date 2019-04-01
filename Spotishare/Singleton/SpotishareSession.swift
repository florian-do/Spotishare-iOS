//
//  SpotishareSession.swift
//  Spotishare
//
//  Created by DO Florian on 3/31/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import Foundation

class SpotishareSession {
    private let roomKey = "room_key"
    private static let instance = SpotishareSession()

    init() {
        
    }
    
    public static func get() -> SpotishareSession {
        return instance
    }
    
    func getRoomCode() -> String {
        return UserDefaults.standard.string(forKey: roomKey) ?? ""
    }
    
    func setRoomCode(code: String) {
        UserDefaults.standard.set(code, forKey: roomKey)
    }
}
