//
//  ExpirationTimeUnit.swift
//  Newt
//
//  Created by Tiago Bras on 10/06/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import Foundation

public enum ExpirationTimeUnit {
    case milliseconds(TimeInterval)
    case seconds(TimeInterval)
    case minutes(TimeInterval)
    case hours(TimeInterval)
    case days(TimeInterval)
    
    var seconds: TimeInterval {
        switch self {
        case .milliseconds(let interval):
            return interval / 1000
        case .seconds(let interval):
            return interval
        case .minutes(let interval):
            return interval * 60
        case .hours(let interval):
            return interval * 3600
        case .days(let interval):
            return interval * 86_400
        }
    }
}
