//
//  TimePeriod.swift
//  Munch
//
//  Created by Heejung Chung on 11/6/17.
//  Copyright © 2017 hjchung. All rights reserved.
//

import Foundation
import SipHash

struct TimePeriod {
    var start: Date
    var end: Date
    
    init(from start: Date, to end: Date) {
        self.start = start
        self.end = end
    }
}

extension TimePeriod: SipHashable {
    func appendHashes(to hasher: inout SipHasher) {
        hasher.append(start)
        hasher.append(end)
    }
    
    static func ==(lhs: TimePeriod, rhs: TimePeriod) -> Bool {
        return lhs.start == rhs.start && lhs.end == rhs.end
    }
    
}
