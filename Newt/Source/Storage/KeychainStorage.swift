//
//  KeychainStorage.swift
//  Newt
//
//  Created by Tiago Bras on 10/06/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import Foundation

class KeychainStorage {
    private var keychainWrapper: KeychainWrapper
    private var encoder = JSONEncoder()
    private var decoder = JSONDecoder()
    
    /// Default Keychain access
    init() {
        keychainWrapper = KeychainWrapper.standard
    }
    
    /// Create a custom instance of KeychainStorage with a custom Service Name
    /// and optional custom access group.
    ///
    /// - Parameters:
    ///   - serviceName: The ServiceName for this instance. Used to uniquely identify
    /// all keys stored using this keychain wrapper instance.
    ///   - accessGroup: Optional unique AccessGroup for this instance. Use a matching
    /// AccessGroup between applications to allow shared keychain access.
    init(serviceName: String, accessGroup: String? = nil) {
        keychainWrapper = KeychainWrapper(
            serviceName: serviceName,
            accessGroup: accessGroup)
    }
}

extension KeychainStorage: Storage {
    func value(forKey key: CacheKey) throws -> Token {
        guard let data = keychainWrapper.data(forKey: key) else {
            throw NewtError.storageDecodingError
        }
        
        return try decoder.decode(Token.self, from: data)
    }
    
    func set(value: Token, forKey key: CacheKey) throws {
        let data = try encoder.encode(value)
        
        keychainWrapper.set(data, forKey: key)
    }
}

