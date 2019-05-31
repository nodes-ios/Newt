//
//  NewtError.swift
//  Newt
//
//  Created by Chris Combs on 31/05/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import Foundation

public enum NewtError: Error {
    case nonTokenStored, emptyToken
}

extension NewtError {
    public var message: String {
        switch self {
        case .nonTokenStored:
            return "Value retrieved from storage did not match Token type"
        case .emptyToken:
            return "Cannot store a nil token"
        }
    }
}