//
//  FirebaseDB.swift
//  Spotishare
//
//  Created by DO Florian on 3/31/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import Foundation
import Firebase

class FirebaseDB {
    private static let instance = FirebaseDB()
    
    lazy var firebaseDb: DatabaseReference = {
        return Database.database().reference()
    }()
    
    init() {
        
    }
    
    public static func get() -> FirebaseDB {
        return instance
    }
}
