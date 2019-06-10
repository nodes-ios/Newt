//
//  Token.swift
//  Newt
//
//  Created by Chris Combs on 31/05/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import Foundation


/// Would be nice to convert this to a protocol to allow different Token types
public final class Token: Codable {
    public init(value: String, expiresIn exp: ExpirationTimeUnit? = nil) {
        self.value = value
        
        if let exp = exp {
            self.expirationDate = Date(timeIntervalSinceNow: exp.seconds)
        } else {
            self.expirationDate = nil
        }
    }
    
    public let value: String
    public let expirationDate: Date?
    
    var isExpired: Bool {
        guard let expirationDate = expirationDate else { return false }
        
        return expirationDate < Date()
    }
}
