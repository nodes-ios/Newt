//
//  Newt.swift
//  Newt
//
//  Created by Chris Combs on 31/05/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import Foundation

public class Newt {
    private let storage: Storage
    public private(set) var storageType: StorageType
    
    public init(storageType: StorageType = .userDefaults) throws {
        self.storageType = storageType
        switch storageType {
        case .userDefaults:
            self.storage = DefaultsStorage()
        case .keychain:
            self.storage = KeychainStorage()
        }
    }
}

extension Newt: TokenStorable {
    public func store(_ token: Token) throws {
        try storage.set(value: token, forKey: Keys.tokenKey)
    }    
}

extension Newt: TokenReadable {
    public func readToken() throws -> Token {
        return try storage.value(forKey: Keys.tokenKey)
    }
}
