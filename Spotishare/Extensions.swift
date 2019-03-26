//
//  extensions.swift
//  Spotishare
//
//  Created by DO Florian on 3/24/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import Foundation

extension String {
    subscript (safe position: Int) -> Character? {
        let index = String.Index(encodedOffset: position)
        let inRange = (position >= 0 && position < self.count)
        return inRange ? self[index] : nil
    }
}
