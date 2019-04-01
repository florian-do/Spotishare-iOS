//
//  RefreshStrategy.swift
//  Spotishare
//
//  Created by DO Florian on 3/29/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import Foundation

class RefreshStrategy {
    private static let instance = RefreshStrategy()
    
    private var params = [String:Int]()
    init() {
        self.params[CDSong().className] = 60
    }
    
    public static func get() -> RefreshStrategy {
        return instance
    }
    
    func shouldRefresh(className: String) -> Bool {
        let time = UserDefaults.standard.double(forKey: className)
        let now = Date()
        return now.timeIntervalSinceReferenceDate > time
    }
    
    func refresh(className: String) {
        let now = Date()
        let classExpire: Int = self.params[className] ?? 0
        let expire = now.addingTimeInterval(TimeInterval(classExpire * 60000))
        UserDefaults.standard.set(expire.timeIntervalSinceReferenceDate, forKey: className)
    }
}
