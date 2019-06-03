//
//  DefaultsStorage.swift
//  Newt
//
//  Created by Chris Combs on 31/05/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import Foundation

class DefaultsStorage {
    let defaults = UserDefaults.standard
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
}

extension DefaultsStorage: Storage {
    func value(forKey key: CacheKey) throws -> Token  {
        guard let data = defaults.value(forKey: key) as? Data else { throw NewtError.storageDecodingError }
        return try decoder.decode(Token.self, from: data)
    }
    
    func set(value: Token, forKey key: CacheKey) throws {
        let data = try encoder.encode(value)
        defaults.set(data, forKey: key)
    }
}
